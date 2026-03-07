import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/add_car_avilability_section.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/country_location_selector.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_name_fields.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_password_fields.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          SignupNameFields(),
          SizedBox(height: AppSizes.h16),
          CustomTextFormField(
            hint: S.of(context).email,
            controller: cubit.emailController,
            validator: (value) => FormValidators.email(
              value,
              S.of(context).emailRequired,
              S.of(context).invalidEmail,
            ),
          ),
          SizedBox(height: AppSizes.h16),
          CustomTextFormField(
            hint: S.of(context).PhoneNumber,
            controller: cubit.phoneController,
            validator: (value) => FormValidators.phone(
              value,
              S.of(context).phoneNumberRequired,
              S.of(context).phoneNumberValidation,
            ),
          ),
          SizedBox(height: AppSizes.h16),
          CountryLocationSelector(),
          SizedBox(height: AppSizes.h16),
          SignupPasswordFields(),
          SizedBox(height: AppSizes.h16),
          AddCarAvilabilitySection(),
        ],
      ),
    );
  }
}
