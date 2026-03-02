import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:quent/Features/auth/presentation/views/forgot_password_view.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/generated/l10n.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final rememberMe = state is LoginToggleRememberMe
                ? state.rememberMe
                : context.read<LoginCubit>().rememberMe;

            return GestureDetector(
              onTap: () =>
                  context.read<LoginCubit>().toggleRememberMe(!rememberMe),
              child: Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<LoginCubit>().toggleRememberMe(value);
                      }
                    },
                  ),
                  Text(
                    S.of(context).rememberMe,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: context.myColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ForgotPasswordView(),
              ),
            );
          },
          child: Text(S.of(context).forgotPassword),
        ),
      ],
    );
  }
}
