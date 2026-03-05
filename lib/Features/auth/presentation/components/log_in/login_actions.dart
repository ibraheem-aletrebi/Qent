import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:quent/core/widgets/custom_button.dart';
import 'package:quent/generated/l10n.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) => state is LoginLoading,
      builder: (context, state) {
        return CustomButton(
          text: S.of(context).loginButton,
          onPressed: () => context.read<LoginCubit>().login(),
          isLoading: state,
        );
      },
    );
  }
}
