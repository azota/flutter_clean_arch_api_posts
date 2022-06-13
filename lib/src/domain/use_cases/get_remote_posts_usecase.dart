import 'package:flutter_app/src/core/usecase/usecase.dart';
import 'package:flutter_app/src/domain/models/data_state_model.dart';
import 'package:flutter_app/src/domain/models/post_model.dart';
import 'package:flutter_app/src/domain/repositories/remote_repository.dart';

class GetRemotePostsUseCase
    implements UseCase<DataState<List<PostModel>>, void> {
  final RemoteRepository _remoteRepository;

  GetRemotePostsUseCase(this._remoteRepository);

  @override
  Future<DataState<List<PostModel>>> call({void params}) {
    return _remoteRepository.getPosts();
  }
}
