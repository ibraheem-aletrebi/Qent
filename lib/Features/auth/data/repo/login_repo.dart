import 'package:quent/Features/auth/data/data_source/auth_data_source.dart';
import 'package:quent/Features/auth/data/models/forgot_password_response_model.dart';
import 'package:quent/Features/auth/data/models/login_request_model.dart';
import 'package:quent/Features/auth/data/models/login_response_model.dart';
import 'package:quent/Features/auth/data/models/reset_password_request_model.dart';
import 'package:quent/core/services/remote/api_result.dart';

class LoginRepo {
  final AuthDataSource authDataSource;
  const LoginRepo({required this.authDataSource});

  Future<ApiResult<LoginResponseModel>> login({
    required LoginRequestModel body,
  }) async {
    try {
      return ApiResult.success(
        await authDataSource.login(loginRequestMode: body),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<ForgotPasswordResponseModel>> forgotPasswordRequest({
    required String email,
  }) async {
    try {
      return ApiResult.success(
        await authDataSource.forgotPasswordRequest(email: email),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<void>> resetPasswordRequest({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) async {
    try {
      return ApiResult.success(
        await authDataSource.resetPasswordRequest(resetPasswordRequestModel: resetPasswordRequestModel),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }



  Future<ApiResult<void>> logout() async {

    try {
      return ApiResult.success(
        await authDataSource.logout(),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }


}
