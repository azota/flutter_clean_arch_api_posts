import 'dart:io';

import 'package:flutter/material.dart';

import 'src/injector.dart';
import 'src/presentation/helper/env_helper.dart';
import 'src/presentation/pages/ecommerce_page.dart';
import 'src/presentation/pages/login_page.dart';
import 'src/presentation/pages/my_posts_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const appEnv = String.fromEnvironment('APP_ENV');
  await EnvHelper().load(fileName: '.env.$appEnv');

  await initializeDependencies();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // post sample
      //home: const MyPostsPage('Posts...'),
      // ecommerce
      //home: const EcommercePage('Ecommerce...'),
      home: const LoginPage(),
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
