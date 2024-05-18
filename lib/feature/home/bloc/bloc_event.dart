part of 'bloc_bloc.dart';

@immutable
sealed class BlocEvent {}

class GetPostBlocEvent extends BlocEvent {}

class CreateBlocEvent extends BlocEvent {
  final String title;
  final String body;

  CreateBlocEvent({required this.title, required this.body});
}

class UpdateBlocEvent extends BlocEvent {
  final PostModel postModel;

  UpdateBlocEvent({required this.postModel});
}
