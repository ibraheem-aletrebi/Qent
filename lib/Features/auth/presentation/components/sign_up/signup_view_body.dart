import 'package:flutter/material.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_actions.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_form.dart';
import 'package:quent/core/resources/app_sizes.dart';

import 'package:quent/core/widgets/custom_logo.dart';
import 'package:quent/generated/l10n.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

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
            S.of(context).signupTitle,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(height: 1.2),
          ),
          SizedBox(height: AppSizes.h32),
          SignupForm(),
          SizedBox(height: AppSizes.h32),
          SignupActions(),
        ],
      ),
    );
  }
}
