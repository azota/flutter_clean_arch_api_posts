part of 'remote_post_bloc.dart';

abstract class RemotePostState {
  final List<PostEntity>? posts;
  final String? error;

  const RemotePostState({this.posts, this.error});
}

class RemotePostLoading extends RemotePostState {
  const RemotePostLoading();
}

class RemotePostError extends RemotePostState {
  const RemotePostError(String error) : super(error: error);
}

class RemotePostLoadingDone extends RemotePostState {
  const RemotePostLoadingDone(List<PostEntity> posts) : super(posts: posts);
}
