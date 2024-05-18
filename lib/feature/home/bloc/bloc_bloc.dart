import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:posts_all/core/app_url/app_url.dart';
import 'package:posts_all/core/error/exception.dart';

import '../../../call_net/network_call_impl/call_data_source.dart';
import '../data/post_model.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocPost extends Bloc<BlocEvent, BlocState> {
  final NetworkDataSource networkDataSource;

  BlocPost(this.networkDataSource) : super(BlocInitial()) {
    on<GetPostBlocEvent>(_getAllPost);
    on<CreateBlocEvent>(_createBlocEvent);
    on<UpdateBlocEvent>(_updatePostEvent);
  }

  //get all post
  FutureOr<void> _getAllPost(
      GetPostBlocEvent event, Emitter<BlocState> emit) async {
    emit(BlocPostLoading());
    try {
      final response = await networkDataSource.apiTypeGet(url: AppUrl.getApi);
      List dummy = response;
      List<PostModel> tempPostList =
          dummy.map((e) => PostModel.fromJson(e)).toList();
      emit(BlocPostSuccess(tempPostList));
    } on ServerException catch (e) {
      emit(BlocPostFailure(e.message));
    }
  }

  //create post
  FutureOr<void> _createBlocEvent(
      CreateBlocEvent event, Emitter<BlocState> emit) async {
    emit(BlocPostCreateLoading());
    try {
      Map<String, dynamic> body = {
        'title': event.title,
        'body': event.body,
        'userId': DateTime.now().toString()
      };
      await networkDataSource.apiTypePost(url: AppUrl.postApi, body: body);
      emit(BlocPostCreateSuccess());
    } on ServerException catch (e) {
      emit(BlocPostFailure(e.message));
    }
  }

  FutureOr<void> _updatePostEvent(
      UpdateBlocEvent event, Emitter<BlocState> emit)async {
    emit(BlocPostCreateLoading());
    try {
      Map<String, dynamic> body = {
        'title': event.postModel.title,
        'body': event.postModel.body,
        'userId': event.postModel.userId,
        'id': event.postModel.id,
      };
      await networkDataSource.apiTypePost(url: AppUrl.postApi, body: body);
      emit(BlocPostCreateSuccess());
    } on ServerException catch (e) {
      emit(BlocPostFailure(e.message));
    }
  }
}
