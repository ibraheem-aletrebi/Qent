import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/custom_date_time_field.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/yes_no_option.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/custom_text_form_field.dart';
import 'package:quent/generated/l10n.dart';

class AddCarAvilabilitySection extends StatelessWidget {
  const AddCarAvilabilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Column(
          children: [
            YesNoOption(
              label: S.of(context).availableToAddCar,
              value: context.watch<SignupCubit>().addCar,
              onChanged: (value) {
                context.read<SignupCubit>().setAddCar(value);
              },
            ),
            Visibility(
              visible: context.watch<SignupCubit>().addCar,
              child: Column(
                children: [
                  SizedBox(height: AppSizes.h16),
                  CustomTextFormField(
                    hint: S.of(context).nationalId,
                    controller: context
                        .read<SignupCubit>()
                        .nationalIdController,
                    validator: (value) => FormValidators.nationalId(
                      value,
                      S.of(context).nationalIdRequired,
                      S.of(context).nationalIdValidation,
                    ),
                  ),
                  SizedBox(height: AppSizes.h16),
                  CustomDatePickerField(
                    validator: (value) => FormValidators.birthDate(
                      value,
                      S.of(context).birthDateRequired,
                      S.of(context).invalidDateFormat,
                      S.of(context).ageRestriction,
                    ),
                    hintText: S.of(context).birthDate,
                    lastDate: DateTime.now(),
                    onDateSelected: (birthDate) {
                      context.read<SignupCubit>().selectBirthDate(
                        DateFormat('yyyy-MM-dd').format(birthDate),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
