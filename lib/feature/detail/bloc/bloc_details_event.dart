part of 'bloc_details_bloc.dart';

@immutable
abstract class BlocEvent {}

class GetCommentEvent extends BlocEvent {
  final String postId;

  GetCommentEvent({required this.postId});
}

class DeletePostEvent extends BlocEvent {
  final String postId;

  DeletePostEvent({required this.postId});
}

