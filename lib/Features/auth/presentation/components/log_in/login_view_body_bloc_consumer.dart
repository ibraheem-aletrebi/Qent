import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/log_in/login_view_body.dart';
import 'package:quent/Features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/routing/app_route.dart';
import 'package:quent/generated/l10n.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(S.of(context).loginSuccess)));

          context.pushReplacementNamed(AppRoutes.main);
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorModel.action ?? state.errorModel.message,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return LoginViewBody();
      },
    );
  }
}
