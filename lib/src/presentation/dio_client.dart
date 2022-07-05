import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'helper/cookie.helper.dart';

const int connectionTimeout = 10 * 1000;
const int receiveTimeout = 10 * 1000;

// 401 응답 무한루프 방지용
const _maxLoopCount = 5;

class DioClient {
  static final DioClient _singleton = DioClient._internal();

  factory DioClient() {
    return _singleton;
  }

  late final Dio _dio;
  String _cookie = '';
  var _loopCount = 0;

  get dio => _dio;

  void setCookie(cookie) {
    _cookie = cookie;
  }

  // ignore: long-method
  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
      ),
    );

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    };

    _dio.interceptors.add(LogInterceptor());

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          var ENC_VAL = await CookieHelper().getCookie('ENC_VAL');
          if (ENC_VAL != null) {
            options.queryParameters['ENC_VAL'] = ENC_VAL;
          }

          // refreshToken으로 idToken을 발급 받는 API('/updatetoken')를 호출하는 경우
          // 이미 idToken이 expired or invalid 상태이므로 'Authorization'를 세팅하지 않음
          if (!options.path.contains('/updatetoken')) {
            var Authorization = await CookieHelper().getCookie('itkn');
            if (Authorization != null) {
              options.headers['Authorization'] = 'Bearer $Authorization';
            }
          }

          options.headers['cookie'] = _cookie;

          handler.next(options);
        },
        onResponse: (
          Response response,
          ResponseInterceptorHandler handler,
        ) async {
          if (response.requestOptions.method == "POST") {
            if (response.headers['set-cookie'] != null) {
              await CookieHelper()
                  .setFromSetCookies(response.headers.map['set-cookie']!);
            }
          }

          handler.next(response);
        },
        onError: (error, handler) async {
          await _refreshToken(error, handler);
        },
      ),
    );
  }

  Future<void> _refreshToken(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    /* if (error.response?.statusCode == 401) {
      // api가 아래 originRequest에 대해 401을 리턴할 경우 발생하는 무한루프 대비
      if (++_loopCount > _maxLoopCount) {
        Future.delayed(Duration(seconds: 5), () {
          _loopCount = 0;
        });

        return handler.next(error);
      }
      var refreshToken = await CookieHelper().getCookie('rtkn');
      final param =
          UpdateTokenParam.fromJson({'refreshToken': '$refreshToken'});
      final response =
          await GetIt.instance<AuthenticationUsecase>().updateToken(param);
      if (response.success) {
        CookieHelper().setCustomCookie('itkn', '${response.idToken}', 30);
        final options = new Options(
          method: error.requestOptions.method,
          headers: error.requestOptions.headers,
        );

        final baseUrl = error.requestOptions.baseUrl;
        var path = error.requestOptions.path;
        if ((baseUrl.lastIndexOf('/') == baseUrl.length - 1) &&
            path.startsWith('/')) {
          path = path.substring(1);
        }

        try {
          final originRequest = await _dio.request(
            '$baseUrl$path',
            options: options,
            data: error.requestOptions.data,
            queryParameters: error.requestOptions.queryParameters,
          );

          return handler.resolve(originRequest);
        } catch (e) {
          print(e);
        }
      }
    } */

    handler.next(error);
  }
}
