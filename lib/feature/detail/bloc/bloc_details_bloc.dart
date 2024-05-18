import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../call_net/network_call_impl/call_data_source.dart';
import '../../../core/app_url/app_url.dart';
import '../../../core/error/exception.dart';
import '../data/commet_model.dart';

part 'bloc_details_event.dart';

part 'bloc_details_state.dart';

class BlocDetails extends Bloc<BlocEvent, BlocDetailState> {
  final NetworkDataSource networkDataSource;

  BlocDetails(this.networkDataSource) : super(DetailsInitial()) {
    on<GetCommentEvent>(_getPostComments);
    on<DeletePostEvent>(_deletePostComment);
  }

  FutureOr<void> _getPostComments(
      GetCommentEvent event, Emitter<BlocDetailState> emit) async {
    emit(BlocCommentLoading());
    try {
      final url = '${AppUrl.postApi}/${event.postId}/comments';
      final response = await networkDataSource.apiTypeGet(url: url);
      List dummy = response;
      List<CommentModel> tempCommentList =
          dummy.map((e) => CommentModel.fromJson(e)).toList();
      emit(BlocCommentSuccess(tempCommentList));
    } on ServerException catch (e) {
      emit(BlocCommentFailure(e.message));
    }
  }

  FutureOr<void> _deletePostComment(
      DeletePostEvent event, Emitter<BlocDetailState> emit) async {
    emit(BlocCommentLoading());
    try {
      final url = '${AppUrl.postApi}/${event.postId}';
      await networkDataSource.apiTypeDelete(url: url);
      emit(BlocDetailPostDeleteSuccess());
    } on ServerException catch (e) {
      emit(BlocCommentFailure(e.message));
    }
  }
}
