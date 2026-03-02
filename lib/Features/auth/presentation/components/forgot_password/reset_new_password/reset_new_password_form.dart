import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class ResetNewPasswordForm extends StatelessWidget {
  const ResetNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<ForgotPasswordFlowCubit>().resetPasswordFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context
                .read<ForgotPasswordFlowCubit>()
                .passwordController,
            hint: S.of(context).newPassword,
            isPassword: true,
            validator: (value) => FormValidators.password(
              value,
              S.of(context).passwordRequired,
              S.of(context).passwordTooShort,
            ),
          ),
          SizedBox(height: AppSizes.h16),
          CustomTextFormField(
            controller: context
                .read<ForgotPasswordFlowCubit>()
                .confirmPasswordController,
            hint: S.of(context).confirmPassword,
            isPassword: true,
            validator: (value) => FormValidators.confirmPassword(
              context
                  .read<ForgotPasswordFlowCubit>()
                  .passwordController
                  .text
                  .trim(),
              value,
              S.of(context).passwordDoNotMatch,
            ),
          ),
        ],
      ),
    );
  }
}
