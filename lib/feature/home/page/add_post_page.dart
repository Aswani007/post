import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_all/core/theme/app_palette.dart';
import 'package:posts_all/feature/home/bloc/bloc_bloc.dart';
import 'package:posts_all/feature/home/page/home.dart';

import '../data/post_model.dart';
import '../widget/c_text_field.dart';

class AddPostPage extends StatefulWidget {
  final PostModel? postModel;

  const AddPostPage({super.key, this.postModel});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final titleTxt = TextEditingController();
  final bodyTxt = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleTxt.dispose();
    bodyTxt.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //if postModel is null means add new post else update post
    titleTxt.text = widget.postModel == null ? '' : widget.postModel!.title;
    bodyTxt.text = widget.postModel == null ? '' : widget.postModel!.body;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postModel != null ? 'Edit Post' : "Add Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CField(
                controller: titleTxt,
                hintText: 'Title',
              ),
              const SizedBox(height: 20),
              CField(
                controller: bodyTxt,
                hintText: 'body',
              ),
              const SizedBox(height: 20),
              BlocConsumer<BlocPost, BlocState>(
                builder: (context, state) {
                  if (state is BlocPostCreateLoading) {
                    return Text((widget.postModel == null
                        ? 'Creating Post..'
                        : 'Updating Post..'));
                  }
                  return MaterialButton(
                    color: AppPalette.black,
                    minWidth: double.infinity,
                    height: 50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      if (widget.postModel == null) {
                        if (_formKey.currentState!.validate()) {
                          context.read<BlocPost>().add(CreateBlocEvent(
                                title: titleTxt.text.trim(),
                                body: bodyTxt.text.trim(),
                              ));
                        }
                      } else {
                        if (_formKey.currentState!.validate()) {
                          context.read<BlocPost>().add(
                              UpdateBlocEvent(postModel: widget.postModel!));
                        }
                      }
                    },
                    child: Text(widget.postModel == null ? 'Save' : 'Update',style: const TextStyle(color: AppPalette.whiteColor),),
                  );
                },
                listener: (BuildContext context, BlocState state) {
                  if (state is BlocPostCreateSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(widget.postModel == null
                            ? 'Post Created Successfully'
                            : 'Post Updated Successfully')));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx) => const HomePage()),
                        (route) => false);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
