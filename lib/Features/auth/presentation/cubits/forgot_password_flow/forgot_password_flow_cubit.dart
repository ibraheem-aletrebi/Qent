import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/domain/repo/auth_repo.dart';
import 'package:quent/Features/auth/data/models/forgot_password_response_model.dart';
import 'package:quent/Features/auth/data/models/reset_password_request_model.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_new_password/reset_new_password_view.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/verify_otp/reset_password_otp_view.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_password_request/reset_password_request_view.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

part 'forgot_password_flow_state.dart';

class ForgotPasswordFlowCubit extends Cubit<ForgotPasswordFlowState> {
  ForgotPasswordFlowCubit({required this.authRepo})
    : super(ForgotPasswordInitial());

  final AuthRepo authRepo;
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

  final List<Widget> steps = const [
    ResetPasswordRequestView(),
    ResetPasswordOtpView(),
    ResetNewPasswordView(),
  ];

  int get numberOfSteps => steps.length;

  void _goToNext() {
    pageController.animateToPage(
      ++currentStep,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> forgotPasswordRequest() async {
    if (resetPasswordRequestFormKey.currentState?.validate() != true) return;

    emit(Loading());

    final result = await authRepo.forgotPasswordRequest(
      email: emailController.text.trim(),
    );

    result.when(
      onSuccess: (ForgotPasswordResponseModel data) async {
        otp = data.code;

        await LocalSecureStorageHelper().write(
          key: SecureStorageKeys.resetToken,
          value: data.resetToken,
        );

        emit(ForgotPasswordRequestSuccess(forgotPasswordResponseModel: data));

        _goToNext();
      },
      onError: (error) {
        emit(Failure(errorMode:error));
      },
    );
  }

  Future<void> verifyOtp() async {
    if (otpFormKey.currentState?.validate() != true) return;

    emit(Loading());

    if (otp == otpController.text.trim()) {
      emit(OtpVerificationSuccess());
      _goToNext();
    } else {
      emit(OtpVerificationError());
    }
  }

  Future<void> resendOtp() async {
    otpController.clear();
    emit(Loading());

    final result = await authRepo.forgotPasswordRequest(
      email: emailController.text.trim(),
    );

    result.when(
      onSuccess: (ForgotPasswordResponseModel data) async {
        otp = data.code;

        await LocalSecureStorageHelper().write(
          key: SecureStorageKeys.resetToken,
          value: data.resetToken,
        );

        emit(ResendOtpSuccess(forgotPasswordResponseModel: data));
      },
      onError: (error) {
        emit(Failure(errorMode:error));
      },
    );
  }

  Future<void> resetPassword() async {
    if (resetPasswordFormKey.currentState?.validate() != true) return;

    emit(Loading());

    final resetToken = await LocalSecureStorageHelper().read(
      SecureStorageKeys.resetToken,
    );

    final result = await authRepo.resetPasswordRequest(
      resetPasswordRequestModel: ResetPasswordRequestModel(
        resetToken: resetToken!,
        code: otpController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      ),
    );

    result.when(
      onSuccess: (_) {
        emit(ResetPasswordSuccess());
      },
      onError: (error) {
        emit(Failure(errorMode:error));
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
