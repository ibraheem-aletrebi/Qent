part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseModel data;

  const LoginSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

class LoginError extends LoginState {
  final ErrorModel apiErrorModel;

  const LoginError({required this.apiErrorModel});

  @override
  List<Object?> get props => [apiErrorModel];
}

class LoginToggleRememberMe extends LoginState {
  final bool rememberMe;

  const LoginToggleRememberMe({required this.rememberMe});

  @override
  List<Object?> get props => [rememberMe];
}
