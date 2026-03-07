import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quent/core/services/remote/interceptors/auth_interceptor.dart';
import 'package:quent/core/services/remote/interceptors/logger_interceptor.dart';

class DioClient {
  DioClient._internal();
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio dio;

  final String _baseUrl = 'https://qent.azurewebsites.net/api';

  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        // connectTimeout: const Duration(minutes: 1),
        // receiveTimeout: const Duration(minutes: 1),
        // sendTimeout: const Duration(minutes: 1),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(AuthInterceptor(dio));
    if (kDebugMode) {
      dio.interceptors.add(LoggerInterceptor());
    }
  }
}
