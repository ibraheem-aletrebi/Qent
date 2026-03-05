part of 'phone_verify_cubit.dart';

sealed class PhoneVerifyState extends Equatable {
  const PhoneVerifyState();

  @override
  List<Object> get props => [];
}

final class PhoneVerifyInitial extends PhoneVerifyState {}

final class PhoneVerifyLoading extends PhoneVerifyState {}

final class PhoneVerifyResendCode extends PhoneVerifyState {
  final VerifyPhoneResponseModel verifyPhoneResponseModel;
  const PhoneVerifyResendCode({required this.verifyPhoneResponseModel});
}

final class PhoneVerifyCodeVerified extends PhoneVerifyState {
  final PhoneVerifiedResponseModel phoneVerifiedResponseModel;
  const PhoneVerifyCodeVerified({required this.phoneVerifiedResponseModel});
}

final class PhoneVerifyError extends PhoneVerifyState {
  final ErrorModel errorModel;
  const PhoneVerifyError({required this.errorModel});
}
