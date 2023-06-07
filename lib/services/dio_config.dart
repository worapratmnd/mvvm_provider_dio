import 'package:dio/dio.dart';
import 'package:mvvm_provider_dio/app.dart';
import 'package:mvvm_provider_dio/constants/network_api.dart';

class DioConfig {
  static final Dio _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Content-Type'] = 'application/json';
          options.headers['Accept'] = 'application/json';
          options.baseUrl = NetworkAPI.baseURL;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          switch (e.response?.statusCode) {
            case 400:
              logger.e('Bad request');
              break;
            case 401:
              logger.e('Unauthorize');
              break;
            case 403:
              logger.e('Forbidden');
              break;
            case 404:
              logger.e('Not found');
              break;
            case 500:
              logger.e('Interal server error');
              break;
            default:
              logger.e('Something went wrong');
          }
          return handler.next(e);
        },
      ),
    );
  static Dio get dioInstance => _dio;
}
