import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/auth_action_promp.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_view_body_bloc_listener.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/injector.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: SignupViewBodyBlocListener()),
        bottomNavigationBar: AuthActionPrompt(
          leadingText: S.of(context).alreadyHaveAccount,
          actionText: S.of(context).login,
          onActionTap: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
