import 'package:dio/dio.dart';

class PendingRequest {
  final RequestOptions requestOptions;
  final ErrorInterceptorHandler handler;

  const PendingRequest(this.requestOptions, this.handler);
}
