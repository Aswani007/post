part of 'bloc_bloc.dart';

@immutable
sealed class BlocState {}

final class BlocInitial extends BlocState {}

final class BlocPostSuccess extends BlocState {
  final List<PostModel> postList;

  BlocPostSuccess(this.postList);

  BlocPostSuccess copyWith({List<PostModel>? postList}) {
    return BlocPostSuccess(postList ?? this.postList);
  }
}

final class BlocPostFailure extends BlocState {
  final String error;

  BlocPostFailure(this.error);
}

final class BlocPostLoading extends BlocState {}

final class BlocPostCreateLoading extends BlocState {}

final class BlocPostCreateSuccess extends BlocState {}
