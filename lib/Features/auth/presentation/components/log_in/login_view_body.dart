import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/log_in/login_actions.dart';
import 'package:quent/Features/auth/presentation/components/log_in/login_form.dart';
import 'package:quent/Features/auth/presentation/components/log_in/remember_me_and_forgot_password.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_logo.dart';
import 'package:quent/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLogo(),
          SizedBox(height: AppSizes.h32),
          Text(
            S.of(context).loginTitle,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(height: 1.2),
          ),
          SizedBox(height: AppSizes.h32),
          const LoginForm(),
          SizedBox(height: AppSizes.h16),
          const RememberMeAndForgotPassword(),
          SizedBox(height: AppSizes.h32),
          LoginActions(),
        ],
      ),
    );
  }
}
