import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../dio_client.dart';
import 'env_helper.dart';

const PERSIST_COOKIES = [];

class CookieHelper {
  static final CookieHelper _singleton = CookieHelper._internal();
  late CookieManager _cookieManager;
  late List<Cookie> _cookies;
  final DioClient _dioClient = DioClient();

  static final _cookieDomain = EnvHelper().API_URL.replaceFirst('m.', '.');
  static final _cookieUri = Uri.parse(_cookieDomain);

  CookieHelper._internal() {
    _cookieManager = CookieManager.instance();
  }

  factory CookieHelper() {
    return _singleton;
  }

  Future<void> init() async {
    _cookies = await _cookieManager.getCookies(url: _cookieUri);
    _dioClient.setCookie(await getCookieString());
  }

  /// {name} 받아서 추가 가져옴
  Future<String?> getCookie(name) {
    return _getCookie(name);
  }

  Future<void> setCookie(cookie) async {
    await _setCookie(cookie);
    _dioClient.setCookie(await getCookieString());
  }

  Future<void> deleteCookie(cookieName) async {
    await _deleteCookie(cookieName);
    _dioClient.setCookie(await getCookieString());
  }

  Future<void> syncRestCookie() async {
    _dioClient.setCookie(await getCookieString());
  }

  Future<void> setFromSetCookies(List<String> cookies) async {
    /* await Future.forEach<String>(cookies, (cookie) async {
      var newCookie = Cookie.fromSetCookieValue(cookie);
      if (newCookie.value.isEmpty) {
        return;
      }
      if (newCookie.domain == null || newCookie.domain!.isEmpty) {
        // 서버에서 도메인 세팅한 쿠키는 도메인 유지, 도메인 세팅안한 쿠키는 앱에서 도메인 추가
        newCookie.domain = _cookieDomain;
      }

      await _setCookie(newCookie);
    });

    _dioClient.setCookie(await getCookieString()); */
  }

  Future<void> deleteAllCookies() async {
    _deleteAllCookies(_cookieDomain);
  }

  Future<void> _deleteAllCookies(String domain) async {
    final _cookieUri = Uri.parse(domain);
    var cookies = await _cookieManager.getCookies(url: _cookieUri);
    await Future.forEach<Cookie>(cookies, (cookie) async {
      if (!PERSIST_COOKIES.contains(cookie.name)) {
        await _cookieManager.deleteCookie(url: _cookieUri, name: cookie.name);
      }
    });

    _dioClient.setCookie(await getCookieString());
  }

  Future<String> getCookieString() async {
    _cookies = await _cookieManager.getCookies(url: _cookieUri);

    var cookieStr = _cookies
        .map((entry) {
          return entry.value.contains('~') && !entry.value.startsWith('"')
              ? entry.name + '="' + entry.value + '"'
              : entry.name + '=' + entry.value;
        })
        .toList()
        .join('; ');

    return cookieStr;
  }

  Future<void> _setCookie(Cookie cookie) async {
    await _cookieManager.setCookie(
      url: _cookieUri,
      name: cookie.name,
      value: cookie.value,
      /* maxAge: cookie.maxAge, */
    );
  }

  Future<void> _deleteCookie(String cookieName) async {
    await _cookieManager.deleteCookie(
      url: _cookieUri,
      name: cookieName,
    );
  }

  Future<String?> _getCookie(String name) async {
    var cookie = await _cookieManager.getCookie(url: _cookieUri, name: name);

    return cookie?.value;
  }

  /// Sets a custom cookie
  Future<void> setCustomCookie(String key, String value, int expireDays) async {
    final cookie = Cookie(name: key, value: value)..domain = _cookieDomain;
    if (expireDays > 0) {
      /* cookie.maxAge = 24 * 60 * 60 * expireDays; */
    }
    await _setCookie(cookie);
  }

  Future<void> printAllCookies() async {
    var cookies = await _cookieManager.getCookies(url: _cookieUri);

    cookies.forEach((element) {
      var cookieValue = element.value;

      log('[test] ${element.name}=${cookieValue}; ${element.isSessionOnly}; ${element.expiresDate}');
    });
  }

  String _decodedValue(String? cookieValue) {
    var base64ToUtf8 = utf8.decode(base64Decode(cookieValue ?? ''));

    return base64ToUtf8;
  }
}

class ParamInfo {
  String name;
  String? value;
  ParamInfo(
    this.name, {
    this.value,
  });
}
