import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/remote_data/post_api_provider.dart';
import 'data/repositories/remote_repository_impl.dart';
import 'domain/repositories/remote_repository.dart';
import 'domain/use_cases/get_ecommerce_usecase.dart';
import 'domain/use_cases/get_remote_comments_usecase.dart';
import 'domain/use_cases/get_remote_posts_usecase.dart';
import 'presentation/dio_client.dart';
import 'presentation/helper/env_helper.dart';
import 'presentation/manager/ecommerce_bloc/ecommerce_bloc.dart';
import 'presentation/manager/remote_comment_bloc/remote_comment_bloc.dart';
import 'presentation/manager/remote_post_bloc/remote_post_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  DioClient _dioClient = DioClient();

  // Dio client
  // dio 그대로 사용
  //injector.registerSingleton<Dio>(Dio());
  // dio 커스텀해서 사용
  injector.registerSingleton<Dio>(_dioClient.dio);

  // Dependencies
  injector.registerSingleton<PostApiProvider>(
    PostApiProvider(injector(), baseUrl: EnvHelper().API_URL),
  );

  // Repositories
  injector.registerSingleton<RemoteRepository>(
    RemoteRepositoryImpl(injector()),
  );

  // UseCases
  injector.registerSingleton<GetRemotePostsUseCase>(
    GetRemotePostsUseCase(injector()),
  );
  injector.registerSingleton<GetRemoteCommentsByPostIdUseCase>(
    GetRemoteCommentsByPostIdUseCase(injector()),
  );
  injector.registerSingleton<GetEcommerceUseCase>(
    GetEcommerceUseCase(injector()),
  );

  // Blocs
  injector.registerFactory<RemotePostBloc>(() => RemotePostBloc(injector()));
  injector
      .registerFactory<RemoteCommentBloc>(() => RemoteCommentBloc(injector()));
  injector.registerFactory<EcommerceBloc>(() => EcommerceBloc(injector()));
}
