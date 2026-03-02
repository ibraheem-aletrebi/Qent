import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/auth_title_body.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_new_password/reset_new_password_actions.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/reset_new_password/reset_new_password_form.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/generated/l10n.dart';

class ResetNewPasswordView extends StatelessWidget {
  const ResetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthTitleBody(
          title: S.of(context).resetPasswordNewPasswordTitle,
          body: S.of(context).resetPasswordNewPasswordSubtitle,
        ),
        SizedBox(height: AppSizes.h32),
        ResetNewPasswordForm(),
        SizedBox(height: AppSizes.h32),
        ResetNewPasswordActions(),
      ],
    );
  }
}
