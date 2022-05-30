import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/src/data/models/comment_model.dart';
import 'package:flutter_app/src/domain/use_cases/get_remote_comments_usecase.dart';

part 'remote_comment_event.dart';

part 'remote_comment_state.dart';

class RemoteCommentBloc extends Bloc<RemoteCommentEvent, RemoteCommentState> {
  final GetRemoteCommentsByPostIdUseCase _getRemoteCommentsByPostIdUseCase;

  RemoteCommentBloc(this._getRemoteCommentsByPostIdUseCase)
      : super(RemoteCommentLoading()) {
        on<RemoteCommentEvent>(_getRemoteComments);
      }


  Future<void> _getRemoteComments(RemoteCommentEvent event, Emitter<RemoteCommentState> emit) async {
    final response = await _getRemoteCommentsByPostIdUseCase(params: event.postId);
    if (response.comments.isEmpty) {
      emit(RemoteCommentError(response.error));
    } else {
      emit(RemoteCommentLoadingDone(response.comments));
    }
  }
}
