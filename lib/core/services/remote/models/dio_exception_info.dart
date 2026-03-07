import 'package:dio/dio.dart';

class DioExceptionInfo {
  final int? statusCode;
  final String? message;
  final DioExceptionType? type;
  final String rawString;

  DioExceptionInfo({
    this.statusCode,
    this.message,
    this.type,
    required this.rawString,
  });
}
