import 'package:quent/Features/auth/data/models/forgot_password_response_model.dart';
import 'package:quent/Features/auth/data/models/login_request_model.dart';
import 'package:quent/Features/auth/data/models/login_response_model.dart';
import 'package:quent/Features/auth/data/models/phone_verified_response_model.dart';
import 'package:quent/Features/auth/data/models/reset_password_request_model.dart';
import 'package:quent/Features/auth/data/models/signup_request_model.dart';
import 'package:quent/Features/auth/data/models/signup_response_model.dart';
import 'package:quent/Features/auth/data/models/verify_phone_response_model.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/location_model.dart';
import 'package:quent/core/services/remote/api_result.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/models/paginated_response.dart';

abstract class AuthRepo {
  Future<ApiResult<LoginResponseModel>> login({
    required LoginRequestModel body,
  });
  Future<ApiResult<ForgotPasswordResponseModel>> forgotPasswordRequest({
    required String email,
  });

  Future<ApiResult<void>> resetPasswordRequest({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  });

  Future<ApiResult<void>> logout();

  Future<ApiResult<PaginatedResponse<CountryModel>>> fetchCountries(
    int page,
    String search,
  );

  Future<ApiResult<PaginatedResponse<LocationModel>>> fetchLocations(
    int page,
    String search,
  );

  Future<ApiResult<SignupResponseModel>> signUp({
    required SignupRequestModel signupRequestModel,
  });

  Future<ApiResult<VerifyPhoneResponseModel>> verifyPhone({
    required String phone,
  });
  Future<ApiResult<PhoneVerifiedResponseModel>> verifyPhoneConfirm({
    required String verifyToken,
    required String code,
  });
}
