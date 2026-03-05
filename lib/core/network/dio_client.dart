import 'package:dio/dio.dart';

class DioClient {
  DioClient(this._dio);
  final Dio _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
  }) {
    return _dio.get<T>(path, queryParameters: query, options: options);
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
  }) {
    return _dio.post<T>(path, data: data, queryParameters: query, options: options);
  }

  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
  }) {
    return _dio.put<T>(path, data: data, queryParameters: query, options: options);
  }

  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
  }) {
    return _dio.delete<T>(path, data: data, queryParameters: query, options: options);
  }
}



