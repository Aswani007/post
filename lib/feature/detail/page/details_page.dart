import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_all/core/global/widget/loader/loader.dart';
import 'package:posts_all/feature/detail/bloc/bloc_details_bloc.dart';
import 'package:posts_all/feature/home/data/post_model.dart';
import 'package:posts_all/feature/home/page/home.dart';

import '../widget/c_comment_widget.dart';

class DetailsPage extends StatelessWidget {
  final PostModel postModel;

  const DetailsPage({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    context
        .read<BlocDetails>()
        .add(GetCommentEvent(postId: postModel.id.toString()));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments for Post ${postModel.title}',
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
              onPressed: () => context
                  .read<BlocDetails>()
                  .add(DeletePostEvent(postId: postModel.id.toString())),
              icon: const Icon(Icons.delete))
        ],
      ),
      body: BlocConsumer<BlocDetails, BlocDetailState>(builder: (context, state) {
        if (state is BlocCommentLoading) {
          return const Loader();
        } else if (state is BlocCommentSuccess) {
          return ListView.builder(
              itemCount: state.commentList.length,
              itemBuilder: (ctx, i) =>
                  CommentCardWidget(commentModel: state.commentList[i]));
        } else if (state is BlocCommentFailure) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      }, listener: (context, state) {
        if (state is BlocDetailPostDeleteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Post Deleted Successfully')));
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (ctx) => const HomePage()),
              (route) => false);
        }
      }),
    );
  }
}
