import 'package:dio/dio.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  bool _isRefreshing = false;
  final List<_PendingRequest> _queue = [];

  AuthInterceptor(this.dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await LocalSecureStorageHelper().getAccessToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.response?.statusCode == 401) {
      return _handle401(error, handler);
    }

    handler.next(error);
  }

  Future<void> _handle401(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = error.requestOptions;

    if (_isRefreshing) {
      _queue.add(_PendingRequest(requestOptions, handler));
      return;
    }

    _isRefreshing = true;

    try {
      final refreshToken = await LocalSecureStorageHelper().getRefreshToken();

      if (refreshToken == null) throw Exception('No refresh token');

      final response = await dio.post(
        '/auth/refresh',
        data: {'refresh': refreshToken},
        options: Options(headers: {'Authorization': null}),
      );

      final newAccess = response.data['access'];
      final newRefresh = response.data['refresh'];

      await LocalSecureStorageHelper().saveTokens(
        access: newAccess,
        refresh: newRefresh,
      );

      _isRefreshing = false;

      final retryResponse = await _retry(requestOptions);
      handler.resolve(retryResponse);

      for (final pending in _queue) {
        await _retry(pending.requestOptions)
            .then(pending.handler.resolve)
            .catchError((error) => pending.handler.reject(error));
      }

      _queue.clear();
    } catch (_) {
      _isRefreshing = false;
      _queue.clear();
      await LocalSecureStorageHelper().deleteTokens();
      handler.next(error);
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final token = await LocalSecureStorageHelper().getAccessToken();

    requestOptions.headers['Authorization'] = 'Bearer $token';
    return dio.fetch(requestOptions);
  }
}

class _PendingRequest {
  final RequestOptions requestOptions;
  final ErrorInterceptorHandler handler;

  _PendingRequest(this.requestOptions, this.handler);
}
