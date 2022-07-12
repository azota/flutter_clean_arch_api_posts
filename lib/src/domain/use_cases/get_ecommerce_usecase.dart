import '../../core/usecase/usecase.dart';
import '../models/data_state_model.dart';
import '../models/ecommerce_model.dart';
import '../repositories/remote_repository.dart';

class GetEcommerceUseCase
    implements UseCase<DataState<List<EcommerceModel>>, void> {
  final RemoteRepository _remoteRepository;

  GetEcommerceUseCase(this._remoteRepository);

  @override
  Future<DataState<List<EcommerceModel>>> call({void params}) {
    return _remoteRepository.getEcommerce();
  }
}
