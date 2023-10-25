// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../domain/domains.dart';

class ApiRepository {
  late Dio dio;

  ApiRepository() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.url,
        validateStatus: (status) => (status ?? 500) < 400,
        receiveDataWhenStatusError: true,
        followRedirects: true,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': '*/*',
        },
      ),
    );

    // final myInterceptor = InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     final accessToken = HiveSettings.get('access_token');
    //     options.headers.addAll(
    //       {
    //         if (accessToken != null) 'Authorization': "Bearer $accessToken",
    //       },
    //     );
    //     handler.next(options);
    //   },
    //   onResponse: (e, handler) {
    //     handler.resolve(e);
    //   },
    //   onError: (dioError, handler) {
    //     if (dioError.error is SocketException) {
    //       handler.resolve(noInternet(dioError.requestOptions));
    //       return;
    //     }
    //     if (dioError.response?.statusCode == 401) {
    //       HiveSettings.delete('access_token');
    //       MyRouter.rootNavigatorKey.currentContext?.go('/login');
    //       handler.reject(DioException(requestOptions: dioError.requestOptions));
    //       return;
    //     }
    //     handler.reject(
    //       DioException(
    //         error: dioError.response?.data["error"],
    //         requestOptions: dioError.requestOptions,
    //         stackTrace: dioError.stackTrace,
    //         message: dioError.response?.data["error"] ?? dioError.message,
    //         type: DioExceptionType.badResponse,
    //       ),
    //     );
    //   },
    // );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  Response noInternet(RequestOptions options) {
    return Response(
      requestOptions: options,
      data: null,
      statusCode: 500,
      statusMessage: 'No Internet',
    );
  }
}
