import '../../core/usecase/usecase.dart';
import '../models/data_state_model.dart';
import '../models/post_model.dart';
import '../repositories/remote_repository.dart';

class GetRemotePostsUseCase
    implements UseCase<DataState<List<PostModel>>, void> {
  final RemoteRepository _remoteRepository;

  GetRemotePostsUseCase(this._remoteRepository);

  @override
  Future<DataState<List<PostModel>>> call({void params}) {
    return _remoteRepository.getPosts();
  }
}
