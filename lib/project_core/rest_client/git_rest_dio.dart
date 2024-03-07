import 'package:blablagithub/constants/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class GitRestDio {
  static late GitRestDio _instance;
  late Dio _http;

  static get instance {
    _instance = GitRestDio._internal();

    return _instance;
  }

  GitRestDio._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout:
          Duration(milliseconds: int.parse(Config.HTTP_CONNECTION_TIMEOUT_MS)),
      receiveTimeout:
          Duration(milliseconds: int.parse(Config.HTTP_READ_TIMEOUT_MS)),
      sendTimeout:
          Duration(milliseconds: int.parse(Config.HTTP_WRITE_TIMEOUT_MS)),
      contentType: 'application/json',
      headers: {
        'User-Agent': 'PostmanRuntime/7.36.3',
      },
    );

    _http = Dio(options);
    if (kDebugMode) {
      _http.interceptors.add(LogInterceptor(
          responseBody: true, requestBody: true, requestHeader: true));
    } else {
      _http.interceptors
          .add(LogInterceptor(responseBody: true, requestHeader: false));
    }
  }

  factory GitRestDio() => GitRestDio._internal();

  get client => _http;

  dispose() {
    _http.close();
  }
}
