import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/auth_title_body.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/verify_otp/email_verify_otp_form.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/verify_otp/reset_password_otp_actions.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/generated/l10n.dart';

class ResetPasswordOtpView extends StatelessWidget {
  const ResetPasswordOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        AuthTitleBody(
          title: S.of(context).resetPasswordOtpTitle,
          body: S.of(context).resetPasswordOtpSubtitle,
        ),
        SizedBox(height: AppSizes.h32),
        Center(child: EmailVerifyOtpForm()),
        SizedBox(height: AppSizes.h32),
        ResetPasswordOtpActions(),
      ],
    );
  }
}
