import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class ResetPasswordRequestForm extends StatelessWidget {
  const ResetPasswordRequestForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgotPasswordFlowCubit>().resetPasswordRequestFormKey,
      child: CustomTextFormField(
        controller: context.watch<ForgotPasswordFlowCubit>().emailController,
        hint: S.of(context).email,
        validator: (value) => FormValidators.email(
          value,
          S.of(context).emailRequired,
          S.of(context).invalidEmail,
        ),
      ),
    );
  }
}
