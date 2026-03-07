import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quent/Features/auth/domain/repo/auth_repo.dart';
import 'package:quent/Features/auth/data/models/login_request_model.dart';
import 'package:quent/Features/auth/data/models/login_response_model.dart';
import 'package:quent/core/constants/hive_keys.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';
import 'package:quent/core/services/local/local_storage_helper.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  final AuthRepo authRepo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoading());

      final result = await authRepo.login(
        body: LoginRequestModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      result.when(
        onSuccess: (LoginResponseModel data) async {
          await LocalSecureStorageHelper().saveTokens(
            access: data.tokens.access,
            refresh: data.tokens.refresh,
          );

          await LocalStorageHelper().setValue(HiveKeys.rememberMe, rememberMe);

          emit(LoginSuccess(data: data));
        },
        onError: (error) {
          emit(LoginError(errorModel: error));
        },
      );
    }
  }

  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(LoginToggleRememberMe(rememberMe: value));
  }

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
