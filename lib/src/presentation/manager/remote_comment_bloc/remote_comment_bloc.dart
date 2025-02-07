import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../domain/models/comment_model.dart';
import '../../../domain/use_cases/get_remote_comments_usecase.dart';

part 'remote_comment_event.dart';

part 'remote_comment_state.dart';

class RemoteCommentBloc extends Bloc<RemoteCommentEvent, RemoteCommentState> {
  final _eventController = StreamController<UiEvent>.broadcast();
  Stream<UiEvent> get eventStream => _eventController.stream;

  final GetRemoteCommentsByPostIdUseCase _getRemoteCommentsByPostIdUseCase;

  RemoteCommentBloc(this._getRemoteCommentsByPostIdUseCase)
      : super(const RemoteCommentLoading()) {
    on<RemoteCommentEvent>(_getRemoteComments);
  }

  Future<void> _getRemoteComments(
    RemoteCommentEvent event,
    Emitter<RemoteCommentState> emit,
  ) async {
    emit(RemoteCommentLoading());
    final response =
        await _getRemoteCommentsByPostIdUseCase(params: event.postId);
    response.when(
      success: (comment) {
        emit(RemoteCommentLoadingDone(comment));
        _eventController.add(UiEvent());
      },
      error: (e, message) {
        emit(const RemoteCommentError('response.error'));
      },
    );
  }
}
