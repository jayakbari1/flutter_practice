import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptors extends Interceptor {
  @override
  FutureOr<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('***On Request*** \n');
    debugPrint(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}");
    debugPrint('Headers:');
    if (options.queryParameters.isEmpty) {
      options.queryParameters['completed'] = false;
      print(options.uri);
      options.headers.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint('queryParameters: ${options.queryParameters}');
    }

    debugPrint(options.path);
    //debugPrint(options.sourceStackTrace.toString());

    if (options.data != null) {
      debugPrint('Body: ${options.data}');
    }
    debugPrint(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}\n");

    handler.next(options);
    // super.onRequest(options, handler);
  }

  @override
  FutureOr<void> onError(DioError dioError, ErrorInterceptorHandler handler) {
    debugPrint('***On Error*** \n');
    debugPrint(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response?.requestOptions.baseUrl) : 'URL')}");
    debugPrint(
        "${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
    debugPrint('<-- End error');
    handler.next(dioError);
  }

  @override
  FutureOr<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) {
    debugPrint('***On Response*** \n');
    debugPrint(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    debugPrint('Headers:');
    response.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint('Response: ${response.data}');
    debugPrint('<-- END HTTP\n');
    handler.next(response);
  }
}
