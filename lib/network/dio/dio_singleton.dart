import 'package:dio/dio.dart';
import 'package:practical_5/network/store/http/dio_store.dart';

class SingletonDio {
  static final SingletonDio _instance = SingletonDio._internal();
  SingletonDio._internal();
  factory SingletonDio() => _instance;

  // Dio getDio = Dio(
  //   BaseOptions(
  //     //queryParameters: {'isCompleted': false},
  //     extra: {'name': 'jay'},
  //     sendTimeout: const Duration(microseconds: 5000),
  //     receiveTimeout: const Duration(milliseconds: 5000),
  //     validateStatus: (status) {
  //       if (status != null && status >= 200 && status < 400) {
  //         //debugPrint('Success ::  ');
  //         return true;
  //       }
  //       return false;
  //     },
  //     followRedirects: true,
  //     headers: DioStore.header,
  //     persistentConnection: false,
  //   ),
  // );
  // ..interceptors.add(LogInterceptor());

  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(microseconds: 0),
      receiveTimeout: const Duration(seconds: 2),
      baseUrl: 'https://6466f9a32ea3cae8dc22d900.mockapi.io/api/v1/',
      followRedirects: true,
      headers: DioStore.header,
      persistentConnection: false,
    ),
  );
  // ..interceptors.add(LogInterceptor(
  //   requestHeader: true,
  //   requestBody: true,
  //   responseBody: true,
  //   responseHeader: false,
  // ))
  // ..interceptors.add(InterceptorsWrapper(
  //   onRequest: (options, handler) => handler.next(options),
  //   onResponse: (e, handler) {
  //     debugPrint('Interceptor Wrapper is Called');
  //     debugPrint(e.data.toString());
  //     handler.next(e);
  //   },
  // ))
  // ..interceptors.add(QueuedInterceptor());
}
