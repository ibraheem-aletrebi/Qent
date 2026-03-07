class VerifyPhoneResponseModel {
  final String message;
  final String code;
  final String verifyToken;

  VerifyPhoneResponseModel({
    required this.message,
    required this.code,
    required this.verifyToken,
  });

  factory VerifyPhoneResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyPhoneResponseModel(
      message: json['message'],
      code: json['code'],
      verifyToken: json['verify_token'],
    );
  }
}
