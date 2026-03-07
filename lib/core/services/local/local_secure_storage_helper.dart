import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureStorageHelper {
  LocalSecureStorageHelper._internal();
  static final LocalSecureStorageHelper _instance =
      LocalSecureStorageHelper._internal();
  factory LocalSecureStorageHelper() => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<bool> contains(String key) async {
    final value = await _storage.read(key: key);
    return value != null;
  }

  Future<void> saveAccessToken(String token) async =>
      write(key: SecureStorageKeys.accessToken, value: token);

  Future<String?> getAccessToken() async => read(SecureStorageKeys.accessToken);

  Future<void> deleteAccessToken() async =>
      delete(SecureStorageKeys.accessToken);

  Future<bool> hasAccessToken() async =>
      contains(SecureStorageKeys.accessToken);

  Future<void> saveRefreshToken(String token) async =>
      write(key: SecureStorageKeys.refreshToken, value: token);

  Future<String?> getRefreshToken() async =>
      read(SecureStorageKeys.refreshToken);

  Future<void> deleteRefreshToken() async =>
      delete(SecureStorageKeys.refreshToken);

  Future<bool> hasRefreshToken() async =>
      contains(SecureStorageKeys.refreshToken);

  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await saveAccessToken(access);
    await saveRefreshToken(refresh);
  }

  Future<void> deleteTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }
}

class SecureStorageKeys {
  SecureStorageKeys._();

  static const accessToken = 'ACCESS_TOKEN';
  static const refreshToken = 'REFRESH_TOKEN';
  static const verifyToken = 'VERIFY_TOKEN';
  static const resetToken = 'RESET_TOKEN';
}
