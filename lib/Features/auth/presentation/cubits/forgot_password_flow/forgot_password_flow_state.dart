part of 'forgot_password_flow_cubit.dart';

sealed class ForgotPasswordFlowState extends Equatable {
  const ForgotPasswordFlowState();

  @override
  List<Object?> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordFlowState {}

final class Loading extends ForgotPasswordFlowState {}

final class ForgotPasswordRequestSuccess extends ForgotPasswordFlowState {
  final ForgotPasswordResponseModel forgotPasswordResponseModel;
  const ForgotPasswordRequestSuccess({
    required this.forgotPasswordResponseModel,
  });
}

final class Failure extends ForgotPasswordFlowState {
  final ErrorModel error;
  const Failure({required this.error});
}

final class OtpVerificationSuccess extends ForgotPasswordFlowState {
  const OtpVerificationSuccess();
}

final class OtpVerificationError extends ForgotPasswordFlowState {
  const OtpVerificationError();
}

final class ResendOtpSuccess extends ForgotPasswordFlowState {
  final ForgotPasswordResponseModel forgotPasswordResponseModel;
  const ResendOtpSuccess({required this.forgotPasswordResponseModel});
}

final class ResendOtpError extends ForgotPasswordFlowState {
  final String message;
  const ResendOtpError(this.message);
  @override
  List<Object?> get props => [message];
}

final class ResetPasswordSuccess extends ForgotPasswordFlowState {}
