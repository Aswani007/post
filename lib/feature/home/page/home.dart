import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_all/feature/home/bloc/bloc_bloc.dart';
import 'package:posts_all/feature/home/widget/card_widget.dart';

import '../../../core/global/widget/loader/loader.dart';
import 'add_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<BlocPost>().add(GetPostBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          //add new post button
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const AddPostPage())),
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<BlocPost, BlocState>(builder: (context, state) {
        if (state is BlocPostLoading) {
          return const Loader();
        } else if (state is BlocPostFailure) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is BlocPostSuccess) {
          return ListView.builder(
            itemCount: state.postList.length,
            itemBuilder: (ctx, i) => CardWidget(postModel: state.postList[i]),
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      }),
    );
  }
}
