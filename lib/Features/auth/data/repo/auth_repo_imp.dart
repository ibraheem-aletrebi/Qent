import 'package:quent/Features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:quent/Features/auth/data/models/forgot_password_response_model.dart';
import 'package:quent/Features/auth/data/models/login_request_model.dart';
import 'package:quent/Features/auth/data/models/login_response_model.dart';
import 'package:quent/Features/auth/data/models/phone_verified_response_model.dart';
import 'package:quent/Features/auth/data/models/reset_password_request_model.dart';
import 'package:quent/Features/auth/data/models/signup_request_model.dart';
import 'package:quent/Features/auth/data/models/signup_response_model.dart';
import 'package:quent/Features/auth/data/models/verify_phone_response_model.dart';
import 'package:quent/Features/auth/domain/repo/auth_repo.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/location_model.dart';
import 'package:quent/core/services/remote/api_result.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/models/paginated_response.dart';

class AuthRepoImp implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImp({required this.authRemoteDataSource});
  @override
  Future<ApiResult<LoginResponseModel>> login({
    required LoginRequestModel body,
  }) async {
    try {
      return ApiResult.success(
        await authRemoteDataSource.login(loginRequestMode: body),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<ForgotPasswordResponseModel>> forgotPasswordRequest({
    required String email,
  }) async {
    try {
      return ApiResult.success(
        await authRemoteDataSource.forgotPasswordRequest(email: email),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<void>> resetPasswordRequest({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) async {
    try {
      return ApiResult.success(
        await authRemoteDataSource.resetPasswordRequest(
          resetPasswordRequestModel: resetPasswordRequestModel,
        ),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
      return ApiResult.success(await authRemoteDataSource.logout());
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<PaginatedResponse<CountryModel>>> fetchCountries(
    int page,
    String search,
  ) async {
    try {
      final response = await authRemoteDataSource.fetchCountries(
        page: page,
        search: search,
      );
      return ApiResult.success(
        PaginatedResponse<CountryModel>.fromPage(
          data: response.data,
          totalCount: response.meta.total,
          currentPage: response.meta.currentPage,
          pageSize: response.meta.perPage,
        ),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<PaginatedResponse<LocationModel>>> fetchLocations(
    int page,
    String search,
  ) async {
    try {
      final response = await authRemoteDataSource.fetchLocations(
        page: page,
        search: search,
      );
      return ApiResult.success(
        PaginatedResponse<LocationModel>.fromPage(
          data: response.data,
          totalCount: response.meta.total,
          currentPage: response.meta.currentPage,
          pageSize: response.meta.perPage,
        ),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<SignupResponseModel>> signUp({
    required SignupRequestModel signupRequestModel,
  }) async {
    try {
      return ApiResult.success(
        await authRemoteDataSource.signup(
          signupRequestModel: signupRequestModel,
        ),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<VerifyPhoneResponseModel>> verifyPhone({
    required String phone,
  }) async {
    try {
      return ApiResult.success(
        await authRemoteDataSource.verifyPhone(phone: phone),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<PhoneVerifiedResponseModel>> verifyPhoneConfirm({
    required String verifyToken,
    required String code,
  }) async {
    try {
      return ApiResult.success(
        await authRemoteDataSource.verifyPhoneConfirm(
          verifyToken: verifyToken,
          code: code,
        ),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
