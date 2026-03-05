import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer';

class LoggerInterceptor extends Interceptor {
  static const _tag = '__';
  static const _reset = '\x1B[0m';
  static const _blue = '\x1B[34m';
  static const _green = '\x1B[32m';
  static const _red = '\x1B[31m';
  static const _cyan = '\x1B[36m';
  static const _yellow = '\x1B[33m';

  String _prettyJson(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  void _line(String color) {
    log(
      "$color══════════════════════════════════════════════════════════════════════════════$_reset",
      name: _tag,
    );
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _line(_blue);

    log(
      "$_blue🚀 REQUEST ► ${options.method} ${options.uri}$_reset",
      name: _tag,
    );

    if (options.headers.isNotEmpty) {
      log("$_cyan📌 Headers:$_reset", name: _tag);
      options.headers.forEach((key, value) {
        log("$_cyan  $key: $value$_reset", name: _tag);
      });
    }

    if (options.queryParameters.isNotEmpty) {
      log("$_cyan📌 Query Parameters:$_reset", name: _tag);
      log("$_yellow${_prettyJson(options.queryParameters)}$_reset", name: _tag);
    }

    if (options.data != null) {
      log("$_yellow📦 Body:$_reset", name: _tag);
      log("$_yellow${_prettyJson(options.data)}$_reset", name: _tag);
    }

    _line(_blue);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _line(_green);

    log(
      "$_green✅ RESPONSE ◄ ${response.statusCode} ${response.requestOptions.uri}$_reset",
      name: _tag,
    );

    if (response.data != null) {
      log("$_green📦 Response Data:$_reset", name: _tag);
      log("$_green${_prettyJson(response.data)}$_reset", name: _tag);
    }

    _line(_green);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _line(_red);

    log(
      "$_red❌ ERROR ◄ ${err.response?.statusCode} ${err.requestOptions.uri}$_reset",
      name: _tag,
    );

    log("$_red⚠ Message: ${err.message}$_reset", name: _tag);

    if (err.response?.data != null) {
      log("$_red📦 Error Data:$_reset", name: _tag);
      log("$_red${_prettyJson(err.response?.data)}$_reset", name: _tag);
    }

    _line(_red);
    handler.next(err);
  }
}
