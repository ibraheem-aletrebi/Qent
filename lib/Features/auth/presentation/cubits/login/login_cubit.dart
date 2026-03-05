import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quent/Features/auth/data/models/login_request_model.dart';
import 'package:quent/Features/auth/data/models/login_response_model.dart';
import 'package:quent/Features/auth/data/repo/login_repo.dart';
import 'package:quent/core/constants/hive_keys.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';
import 'package:quent/core/services/local/local_storage_helper.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repo}) : super(LoginInitial());

  final LoginRepo repo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  void login() async {

    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoading());

      final result = await repo.login(
        body: LoginRequestModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      result.when(
        onSuccess: (data) async {
          LocalSecureStorageHelper().saveTokens(
            access: data.tokens.access,
            refresh: data.tokens.refresh,
          );
          if (rememberMe) {
            await LocalStorageHelper().setValue(HiveKeys.rememberMe, true);
          } else {
            await LocalStorageHelper().setValue(HiveKeys.rememberMe, false);
            await LocalSecureStorageHelper().deleteTokens();
          }
          emit(LoginSuccess(data: data));
        },
        onError: (e) {
          emit(LoginError(apiErrorModel: e));
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
    await super.close();
  }
}
