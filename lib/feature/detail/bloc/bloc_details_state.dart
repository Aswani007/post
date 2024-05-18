part of 'bloc_details_bloc.dart';

@immutable
abstract class BlocDetailState {}

class DetailsInitial extends BlocDetailState {}

final class BlocCommentLoading extends BlocDetailState {}

final class BlocCommentSuccess extends BlocDetailState {
  final List<CommentModel> commentList;

  BlocCommentSuccess(this.commentList);
}

final class BlocCommentFailure extends BlocDetailState {
  final String error;

  BlocCommentFailure(this.error);
}

final class BlocDetailPostDeleteSuccess extends BlocDetailState {}