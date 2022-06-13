import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/src/domain/models/post_model.dart';
import 'package:flutter_app/src/domain/use_cases/get_remote_posts_usecase.dart';

part 'remote_post_event.dart';

part 'remote_post_state.dart';

class RemotePostBloc extends Bloc<RemotePostEvent, RemotePostState> {
  final GetRemotePostsUseCase _getRemotePostsUseCase;

  RemotePostBloc(this._getRemotePostsUseCase)
      : super(const RemotePostLoading()) {
    on<GetRemotePosts>(_getRemotePosts);
  }

  Future<void> _getRemotePosts(
      RemotePostEvent event, Emitter<RemotePostState> emit) async {
    final response = await _getRemotePostsUseCase();

    response.when(success: (posts) {
      emit(RemotePostLoadingDone(posts));
    }, error: (e, message) {
      emit(RemotePostError('response.error'));
    });
  }
}
