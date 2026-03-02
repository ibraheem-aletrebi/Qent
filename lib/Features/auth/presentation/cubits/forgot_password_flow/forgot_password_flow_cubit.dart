import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/data/models/forgot_password_response_model.dart';
import 'package:quent/Features/auth/data/models/reset_password_request_model.dart';
import 'package:quent/Features/auth/data/repo/login_repo.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_new_password/reset_new_password_view.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/verify_otp/reset_password_otp_view.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_password_request/reset_password_request_view.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';
import 'package:quent/core/services/network/api_error_model.dart';

part 'forgot_password_flow_state.dart';

class ForgotPasswordFlowCubit extends Cubit<ForgotPasswordFlowState> {
  ForgotPasswordFlowCubit({required this.repo})
    : super(ForgotPasswordInitial());

  final LoginRepo repo;

  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final PageController pageController = PageController();

  int currentStep = 0;
  late String otp;

  final GlobalKey<FormState> resetPasswordRequestFormKey =
      GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  final List<Widget> steps = [
    const ResetPasswordRequestView(),
    const ResetPasswordOtpView(),
    const ResetNewPasswordView(),
  ];

  int get numberOfSteps => steps.length;

  void _goToNext() {
    pageController.animateToPage(
      ++currentStep,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void forgotPasswordRequest() async {
    if (resetPasswordRequestFormKey.currentState?.validate() != true) return;
    emit(Loading());
    final result = await repo.forgotPasswordRequest(
      email: emailController.text.trim(),
    );
    result.when(
      onSuccess: (data) {
        otp = data.code;
        LocalSecureStorageHelper().write(
          key: SecureStorageKeys.resetToken,
          value: data.resetToken,
        );
        emit(ForgotPasswordRequestSuccess(forgotPasswordResponseModel: data));
        _goToNext();
      },
      onError: (error) {
        emit(Failure(error: error));
      },
    );
  }

  Future<void> verifyOtp() async {
    if (otpFormKey.currentState?.validate() != true) return;
    emit(Loading());
    await Future.delayed(const Duration(seconds: 3));
    if (otp == otpController.text.trim()) {
      emit(OtpVerificationSuccess());
      _goToNext();
    } else {
      emit(OtpVerificationError());
    }
  }

  void resendOtp() async {
    otpController.clear();
    await Future.delayed(const Duration(seconds: 30));
    final result = await repo.forgotPasswordRequest(
      email: emailController.text.trim(),
    );
    result.when(
      onSuccess: (data) {
        LocalSecureStorageHelper().write(
          key: SecureStorageKeys.resetToken,
          value: data.resetToken,
        );
        otp = data.code;
        emit(ResendOtpSuccess(forgotPasswordResponseModel: data));
      },
      onError: (error) {
        emit(Failure(error: error));
      },
    );
  }

  void resetPassword() async {
    if (resetPasswordFormKey.currentState?.validate() != true) return;
    emit(Loading());
    final resetToken = await LocalSecureStorageHelper().read(
      SecureStorageKeys.resetToken,
    );
    final result = await repo.resetPasswordRequest(
      resetPasswordRequestModel: ResetPasswordRequestModel(
        resetToken: resetToken!,
        code: otpController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      ),
    );
    result.when(
      onSuccess: (data) {
        emit(ResetPasswordSuccess());
      },
      onError: (error) {
        emit(Failure(error: error));
      },
    );
  }

  void resetFlow() {
    currentStep = 0;
    pageController.jumpToPage(0);
    emailController.clear();
    otpController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    emit(ForgotPasswordInitial());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    pageController.dispose();
    return super.close();
  }
}
