import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quent/Features/auth/data/models/phone_verified_response_model.dart';
import 'package:quent/Features/auth/data/models/verify_phone_response_model.dart';
import 'package:quent/Features/auth/data/repo/signup_repo.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';
import 'package:quent/core/services/remote/models/error_model.dart';
part 'phone_verify_state.dart';

class PhoneVerifyCubit extends Cubit<PhoneVerifyState> {
  PhoneVerifyCubit({required this.repo}) : super(PhoneVerifyInitial());

  final SignupRepo repo;
  String? phone;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  void init({required String phone, required String code}) {
    otpController.text = code;
    this.phone = phone;
  }

  Future<void> verifyPhoneResendCode() async {
    otpController.clear();
    await Future.delayed(const Duration(seconds: 30));
    final result = await repo.verifyPhone(phone: phone!);
    result.when(
      onSuccess: (data) {
        LocalSecureStorageHelper().write(
          key: SecureStorageKeys.verifyToken,
          value: data.verifyToken,
        );
        emit(PhoneVerifyResendCode(verifyPhoneResponseModel: data));
      },
      onError: (error) {
        emit(PhoneVerifyError(errorModel: error));
      },
    );
  }

  Future<void> verifyPhoneConfirm() async {
    emit(PhoneVerifyLoading());
    final verifyToken = await LocalSecureStorageHelper().read(
      SecureStorageKeys.verifyToken,
    );
    if (formKey.currentState!.validate() == false) return;
    final result = await repo.verifyPhoneConfirm(
      verifyToken: verifyToken!,
      code: otpController.text.trim(),
    );
    result.when(
      onSuccess: (data) {
        emit(PhoneVerifyCodeVerified(phoneVerifiedResponseModel: data));
      },
      onError: (error) {
        emit(PhoneVerifyError(errorModel: error));
      },
    );
  }

  @override
  Future<void> close() {
    otpController.dispose();
    return super.close();
  }
}
