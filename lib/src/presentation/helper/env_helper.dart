import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvHelper {
  late final _API_URL;

  static final EnvHelper _instance = EnvHelper._internal();

  factory EnvHelper() => _instance;

  EnvHelper._internal();

  Future<void> load({required String fileName}) async {
    await dotenv.load(
      fileName: fileName,
    );
    print('yhpark > dotenv: ${dotenv.env['API_URL']}');
    _API_URL = dotenv.env['API_URL'];
  }

  String get API_URL => _API_URL;
}
