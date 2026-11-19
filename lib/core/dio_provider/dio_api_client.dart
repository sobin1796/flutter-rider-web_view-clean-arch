import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tukaatuexpress/core/config/environment_helper.dart';
import 'package:tukaatuexpress/core/dio_provider/api_error.dart';
import 'package:tukaatuexpress/core/dio_provider/api_response.dart';
import 'package:tukaatuexpress/core/preferences/preferences.dart';

class DioApiClient {
  DioApiClient(
    this._dio,
    this._environmentHelper,
    this._preference,
    this._externalDio,
  ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = await _preference.getString(Preference.accessToken);
            // Request options can contain a header retained from an old session.
            options.headers.removeWhere(
              (key, _) => key.toLowerCase() == 'authorization',
            );
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            handler.next(options);
          } catch (error, stackTrace) {
            handler.reject(
              DioException(
                requestOptions: options,
                error: error,
                stackTrace: stackTrace,
              ),
            );
          }
        },
      ),
    );
    _dio.interceptors.add(AppInterceptor());
    _externalDio.interceptors.add(AppInterceptor());
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: true));
      _externalDio.interceptors.add(PrettyDioLogger(requestBody: true));
    }
    _dio.options.baseUrl =
        _environmentHelper.getValue(EnvironmentKey.baseUrl) ?? '';

    _dio.options.headers = {
      'Accept': 'application/json',
      'responseType': ResponseType.json,
    };

    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);
  }
  final Dio _dio;
  final Dio _externalDio;
  final EnvironmentHelper _environmentHelper;
  final Preferences _preference;

  Future<T> httpGet<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response<dynamic>? response;

      response = await _dio.get(url, queryParameters: queryParameters);

      return response.data as T;
    } catch (e) {
      _handleRequestError(e);
      rethrow;
    }
  }

  Future<T> externalHttpGet<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response<dynamic>? response;

      _externalDio.options.headers = {
        'Accept': 'application/json',
        'responseType': ResponseType.json,
      };

      response = await _externalDio.get(url, queryParameters: queryParameters);

      return response.data as T;
    } catch (e) {
      _handleRequestError(e);
      rethrow;
    }
  }

  Future<T> postForList<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    // change is here,dynamic body
    dynamic body,
  }) async {
    try {
      final response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data as T;
    } catch (e) {
      _handleRequestError(e);
      rethrow;
    }
  }

  Future<T> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    FormData? data,
  }) async {
    try {
      final response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: data ?? body,
        options: data == null
            ? null
            : Options(contentType: 'multipart/form-data'),
      );
      return response.data as T;
    } catch (e) {
      _handleRequestError(e);
      rethrow;
    }
  }

  Future<T> patch<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    Response<dynamic>? response;
    response = await _dio.patch(
      url,
      queryParameters: queryParameters,
      data: body,
    );

    return response.data as T;
  }

  Future<T> put<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.put(
        url,
        queryParameters: queryParameters,
        data: body,
        options: Options(responseType: ResponseType.json),
      );

      return response.data as T;
    } catch (e) {
      rethrow;
    }
  }

  Future<T> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    Response<dynamic>? response;

    response = await _dio.delete(
      url,
      data: body,
      queryParameters: queryParameters,
    );

    return response.data as T;
  }

  void _handleRequestError(dynamic error) {
    _debugLog(error.toString());

    if (error is SocketException) {
      final errorCode = error.osError?.errorCode;
      if (errorCode == 61 ||
          errorCode == 60 ||
          errorCode == 111 ||
          errorCode == 101 ||
          errorCode == 104 ||
          errorCode == 51 ||
          errorCode == 8 ||
          errorCode == 113 ||
          errorCode == 7 ||
          errorCode == 64) {
        throw ApiConnectionRefusedError(error);
      }
    }

    if (error is DioException) {
      try {
        // Handle badResponse specifically
        if (error.type == DioExceptionType.badResponse) {
          final data = error.response?.data;
          final message =
              data?['message']?.toString() ??
              'An error occurred with status code ${error.response?.statusCode}';
          throw ApiErrorResponse(message: message);
        }

        final data = error.response?.data;

        if (data == null) {
          throw ApiErrorResponse();
        }

        /// case 1: validation errors
        if (data['error'] is Map<String, dynamic>) {
          final errors = data['error'] as Map<String, dynamic>;
          final firstError = errors.values.firstOrNull?[0];
          throw ApiErrorResponse(message: firstError.toString());
        }

        /// case 2: message is List
        if (data['message'] is List) {
          final message = (data['message'] as List).join(', ');
          throw ApiErrorResponse(message: message);
        }

        /// case 3: message is String
        if (data['message'] is String) {
          throw ApiErrorResponse(message: data['message']);
        }

        throw ApiErrorResponse();
      } catch (e) {
        if (e is ApiErrorResponse) {
          rethrow;
        }
        throw ApiErrorResponse();
      }
    }

    throw error;
  }
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _debugLog(response.data.toString());
    _checkResponseIsOk(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  void _checkResponseIsOk(Response<dynamic> response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) return;
    throw ApiError(response);
  }
}

void _debugLog(String message) {
  if (kDebugMode) {
    debugPrint(message);
  }
}
