enum ApiLocalStatusCode {
  connectionTimeout(1001),
  sendTimeout(1002),
  receiveTimeout(1003),
  connectionError(1004),
  badCertificate(1005),
  cancel(1006),
  unknown(1007),

  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  requestTimeout(408),
  conflict(409),
  validationError(422),
  tooManyRequests(429),

  internalServerError(500),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504),

  defaultError(9999);

  final int code;
  const ApiLocalStatusCode(this.code);

  static ApiLocalStatusCode? fromCode(int code) {
    return values.firstWhere(
      (status) => status.code == code,
      orElse: () => defaultError,
    );
  }

  bool get isClientError => code >= 400 && code < 500;
  bool get isServerError => code >= 500 && code < 600;
  bool get isLocalError => code >= 1000 && code < 2000;
}
