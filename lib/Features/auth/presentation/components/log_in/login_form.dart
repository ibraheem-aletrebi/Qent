import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: cubit.emailController,
            hint: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).emailRequired;
              }
              if (!value.contains('@')) {
                return S.of(context).invalidEmail;
              }
              return null;
            },
          ),
          SizedBox(height: AppSizes.h16),
          CustomTextFormField(
            controller: cubit.passwordController,
            hint: S.of(context).password,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).passwordRequired;
              }
              if (value.length < 6) {
                return S.of(context).passwordTooShort;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
