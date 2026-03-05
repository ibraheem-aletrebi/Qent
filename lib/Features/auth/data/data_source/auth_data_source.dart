import 'package:dio/dio.dart';
import 'package:quent/Features/auth/data/models/country_response_model.dart';
import 'package:quent/Features/auth/data/models/forgot_password_response_model.dart';
import 'package:quent/Features/auth/data/models/location_response_model.dart';
import 'package:quent/Features/auth/data/models/login_request_model.dart';
import 'package:quent/Features/auth/data/models/login_response_model.dart';
import 'package:quent/Features/auth/data/models/phone_verified_response_model.dart';
import 'package:quent/Features/auth/data/models/reset_password_request_model.dart';
import 'package:quent/Features/auth/data/models/signup_request_model.dart';
import 'package:quent/Features/auth/data/models/signup_response_model.dart';
import 'package:quent/Features/auth/data/models/verify_phone_response_model.dart';
import 'package:quent/core/constants/api_end_points.dart';
import 'package:quent/core/services/remote/api_service.dart';

class AuthDataSource {
  final ApiService apiService;
  const AuthDataSource({required this.apiService});
  // logIn
  Future<LoginResponseModel> login({
    required LoginRequestModel loginRequestMode,
  }) async {
    final Response response = await apiService.post(
      ApiEndPoints.login,
      data: loginRequestMode.toJson(),
    );

    return LoginResponseModel.fromJson(response.data);
  }

  // ForgetPassword

  Future<ForgotPasswordResponseModel> forgotPasswordRequest({
    required String email,
  }) async {
    final result = await apiService.post(
      ApiEndPoints.forgotPasswordRequest,
      data: {'email': email},
    );
    return ForgotPasswordResponseModel.fromJson(result.data);
  }

  Future<void> resetPasswordRequest({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) {
    return apiService.post(
      ApiEndPoints.resetPasswordRequest,
      data: resetPasswordRequestModel.toJson(),
    );
  }

  Future<void> logout() async {
    await apiService.post(ApiEndPoints.logout);
  }

  // signUP
  Future<CountryResponseModel> fetchCountries({
    int page = 1,
    String? search,
  }) async {
    final Response response = await apiService.get(
      ApiEndPoints.countries,
      queryParameters: {'page': page, 'search': search},
    );
    return CountryResponseModel.fromJson(response.data);
  }

  Future<LocationResponseModel> fetchLocations({
    int page = 1,
    String? search,
  }) async {
    final Response response = await apiService.get(
      ApiEndPoints.locations,
      queryParameters: {'page': page, 'search': search},
    );
    return LocationResponseModel.fromJson(response.data);
  }

  Future<SignupResponseModel> signup({
    required SignupRequestModel signupRequestModel,
  }) async {
    final Response response = await apiService.post(
      ApiEndPoints.signup,
      data: signupRequestModel.toJson(),
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    return SignupResponseModel.fromJson(response.data);
  }

  // phone verification
  Future<VerifyPhoneResponseModel> verifyPhone({required String phone}) async {
    final Response response = await apiService.post(
      ApiEndPoints.verifyPhoneSendCode,
      data: {'phone': phone},
    );
    return VerifyPhoneResponseModel.fromJson(response.data);
  }

  Future<VerifyPhoneResponseModel> verifyPhoneResendCode({
    required String phone,
  }) async {
    final Response response = await apiService.post(
      ApiEndPoints.verifyPhoneResendCode,
      data: {'phone': phone},
    );
    return VerifyPhoneResponseModel.fromJson(response.data);
  }

  Future<PhoneVerifiedResponseModel> verifyPhoneConfirm({
    required String verifyToken,
    required String code,
  }) async {
    final Response response = await apiService.post(
      ApiEndPoints.verifyPhoneConfirm,
      data: {'verify_token': verifyToken, 'code': code},
    );
    return PhoneVerifiedResponseModel.fromJson(response.data);
  }
}
