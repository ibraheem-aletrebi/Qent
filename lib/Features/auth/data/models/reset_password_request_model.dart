class ResetPasswordRequestModel {
  final String resetToken;
  final String code;
  final String password;
  final String confirmPassword;

  ResetPasswordRequestModel({
    required this.resetToken,
    required this.code,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    'reset_token': resetToken,
    'code': code,
    'password': password,
    'confirm_password': confirmPassword,
  };
}
