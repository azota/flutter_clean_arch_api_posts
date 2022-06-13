import 'package:flutter_app/src/core/usecase/usecase.dart';
import 'package:flutter_app/src/domain/models/comment_model.dart';
import 'package:flutter_app/src/domain/models/data_state_model.dart';
import 'package:flutter_app/src/domain/repositories/remote_repository.dart';

class GetRemoteCommentsByPostIdUseCase
    implements UseCase<DataState<List<CommentModel>>, int> {
  final RemoteRepository _remoteRepository;

  GetRemoteCommentsByPostIdUseCase(this._remoteRepository);

  @override
  Future<DataState<List<CommentModel>>> call({required int params}) {
    return _remoteRepository.getCommentsByPostId(params);
  }
}
