import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvHelper {
  String? _API_URL;

  static final EnvHelper _instance = EnvHelper._internal();

  factory EnvHelper() {
    return _instance;
  }

  EnvHelper._internal() {
    load();
  }

  load() async {
    const APP_ENV = String.fromEnvironment('APP_ENV');
    print('yhpark > APP_ENV: $APP_ENV');
    await dotenv.load(
      fileName: '.env.$APP_ENV',
    );
    print('yhpark > dotenv: ${dotenv.env['API_URL']}');
    _API_URL = dotenv.env['API_URL'] ?? '';
  }

  String get API_URL => _API_URL ?? '';
}
