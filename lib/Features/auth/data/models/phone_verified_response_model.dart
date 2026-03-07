import 'package:quent/core/models/user_model.dart';

class PhoneVerifiedResponseModel {
  final UserModel user;
  final String message;

  PhoneVerifiedResponseModel({required this.user, required this.message});

  factory PhoneVerifiedResponseModel.fromJson(Map<String, dynamic> json) {
    return PhoneVerifiedResponseModel(
      user: UserModel.fromJson(json['user']),
      message: json['message'],
    );
  }
}
