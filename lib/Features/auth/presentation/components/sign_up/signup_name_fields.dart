import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class SignupNameFields extends StatelessWidget {
  const SignupNameFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Row(
      spacing: AppSizes.w16,
      children: [
        Expanded(
          child: CustomTextFormField(
            hint: S.of(context).FirstName,
            controller: cubit.firstNameController,
            validator: (value) => FormValidators.requiredField(value, S.of(context).firstNameRequired),
          ),
        ),
        Expanded(child: CustomTextFormField(hint: S.of(context).LastName,
            controller: cubit.lastNameController,
            validator: (value) => FormValidators.requiredField(value, S.of(context).lastNameRequired))),
      ],
    );
  }
}
