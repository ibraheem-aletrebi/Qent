import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class SignupPasswordFields extends StatelessWidget {
  const SignupPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Row(
      spacing: AppSizes.h16,
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: cubit.passwordController,
            hint: S.of(context).password,
            isPassword: true,
            validator: (value) => FormValidators.password(
              value,
              S.of(context).passwordRequired,
              S.of(context).invalidPassword,
            ),
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            controller: cubit.confirmPasswordController,
            validator: (value) => FormValidators.confirmPassword(
              cubit.passwordController.text.trim(),
              value,
              S.of(context).passwordDoNotMatch,
            ),
            hint: S.of(context).ConfirmPassword,
            isPassword: true,
          ),
        ),
      ],
    );
  }
}
