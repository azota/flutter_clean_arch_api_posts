import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/injector.dart';
import 'src/presentation/app_bloc_observer.dart';
import 'src/presentation/helper/env_helper.dart';
import 'src/presentation/manager/remote_comment_bloc/remote_comment_bloc.dart';
import 'src/presentation/manager/remote_post_bloc/remote_post_bloc.dart';
import 'src/presentation/pages/ecommerce_page.dart';
import 'src/presentation/pages/login_page.dart';
import 'src/presentation/pages/my_posts_page.dart';
import 'src/presentation/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const appEnv = String.fromEnvironment('APP_ENV');
  await EnvHelper().load(fileName: '.env.$appEnv');

  await initializeDependencies();
  HttpOverrides.global = MyHttpOverrides();

  BlocOverrides.runZoned(
    () => runApp(
      /* MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector<RemotePostBloc>(),
          ),
          BlocProvider(
            create: (_) => injector<RemoteCommentBloc>(),
          ),
        ],
        child: const MyApp(),
      ), */
      const MyApp(),
    ),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // post sample
      //home: const MyPostsPage('Posts...'),
      // ecommerce
      //home: const EcommercePage('Ecommerce...'),
      //home: const LoginPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
