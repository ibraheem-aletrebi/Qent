import 'dart:developer';

import 'package:quent/Features/auth/data/data_source/auth_data_source.dart';
import 'package:quent/Features/auth/data/models/phone_verified_response_model.dart';
import 'package:quent/Features/auth/data/models/signup_request_model.dart';
import 'package:quent/Features/auth/data/models/signup_response_model.dart';
import 'package:quent/Features/auth/data/models/verify_phone_response_model.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/location_model.dart';
import 'package:quent/core/services/remote/api_result.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/models/paginated_response.dart';

class SignupRepo {
  final AuthDataSource authDataSource;
  SignupRepo({required this.authDataSource});

  Future<ApiResult<PaginatedResponse<CountryModel>>> fetchCountries(
    int page,
    String search,
  ) async {
    try {
      final response = await authDataSource.fetchCountries(
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

  Future<ApiResult<PaginatedResponse<LocationModel>>> fetchLocations(
    int page,
    String search,
  ) async {
    try {
      final response = await authDataSource.fetchLocations(
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

  Future<ApiResult<SignupResponseModel>> signUp({
    required SignupRequestModel signupRequestModel,
  }) async {
    try {
      return ApiResult.success(
        await authDataSource.signup(signupRequestModel: signupRequestModel),
      );
    } catch (e) {
      log(e.toString());
      return ApiResult.error(e);
    }
  }


  Future<ApiResult<VerifyPhoneResponseModel>> verifyPhone({
    required String phone,
  }) async {
    try {
      return ApiResult.success(
        await authDataSource.verifyPhone(phone: phone),
      );
    } catch (e) {
      log(e.toString());
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<PhoneVerifiedResponseModel>> verifyPhoneConfirm({
    required String verifyToken,
    required String code,
  }) async {
    try {
      return ApiResult.success(
        await authDataSource.verifyPhoneConfirm(verifyToken: verifyToken, code: code),
      );
    } catch (e) {
      log(e.toString());
      return ApiResult.error(e);
    }
  }
}
