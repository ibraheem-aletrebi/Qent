import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quent/Features/auth/domain/repo/auth_repo.dart';
import 'package:quent/Features/auth/data/models/phone_verified_response_model.dart';
import 'package:quent/Features/auth/data/models/verify_phone_response_model.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

part 'phone_verify_state.dart';

class PhoneVerifyCubit extends Cubit<PhoneVerifyState> {
  PhoneVerifyCubit({required this.authRepo}) : super(PhoneVerifyInitial());

  final AuthRepo authRepo;

  String? phone;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  void init({required String phone, required String code}) {
    otpController.text = code;
    this.phone = phone;
  }

  Future<void> verifyPhoneResendCode() async {
    if (phone == null) return;

    otpController.clear();
    emit(PhoneVerifyLoading());

    final result = await authRepo.verifyPhone(phone: phone!);

    result.when(
      onSuccess: (VerifyPhoneResponseModel data) async {
        await LocalSecureStorageHelper().write(
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
    if (formKey.currentState?.validate() != true) return;

    emit(PhoneVerifyLoading());

    final verifyToken = await LocalSecureStorageHelper().read(
      SecureStorageKeys.verifyToken,
    );

    if (verifyToken == null) {
      emit(
        PhoneVerifyError(
          errorModel: ErrorModel(message: "Verification token not found"),
        ),
      );
      return;
    }

    final result = await authRepo.verifyPhoneConfirm(
      verifyToken: verifyToken,
      code: otpController.text.trim(),
    );

    result.when(
      onSuccess: (PhoneVerifiedResponseModel data) {
        emit(PhoneVerifyCodeVerified(phoneVerifiedResponseModel: data));
      },
      onError: (error) {
        emit(
          PhoneVerifyError(errorModel:error),
        );
      },
    );
  }

  @override
  Future<void> close() {
    otpController.dispose();
    return super.close();
  }
}
