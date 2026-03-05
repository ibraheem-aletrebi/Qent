import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/auth_action_promp.dart';
import 'package:quent/Features/auth/presentation/components/log_in/login_view_body_bloc_consumer.dart';
import 'package:quent/Features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:quent/Features/auth/presentation/views/signup_view.dart';
import 'package:quent/injector.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/generated/l10n.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => sl<LoginCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: LoginViewBodyBlocConsumer()),
        bottomNavigationBar: AuthActionPrompt(
          leadingText: S.of(context).noAccount,
          actionText: S.of(context).signup,
          onActionTap: () {
            context.push(const SignupView());
          },
        ),
      ),
    );
  }
}
