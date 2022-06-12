import 'package:flutter_app/src/core/usecase/usecase.dart';
import 'package:flutter_app/src/domain/entitis/post_entity.dart';
import 'package:flutter_app/src/domain/repositories/remote_repository.dart';

class GetRemotePostsUseCase implements UseCase<List<PostEntity>, void> {
  final RemoteRepository _remoteRepository;

  GetRemotePostsUseCase(this._remoteRepository);

  @override
  Future<List<PostEntity>> call({void params}) {
    return _remoteRepository.getPosts();
  }
}
