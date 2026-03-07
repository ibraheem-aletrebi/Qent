import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/resend_otp_button.dart';
import 'package:quent/Features/auth/presentation/cubits/phone_verify/phone_verify_cubit.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/routing/app_route.dart';
import 'package:quent/core/widgets/custom_button.dart';
import 'package:quent/generated/l10n.dart';

class PhoneVerificationActions extends StatelessWidget {
  const PhoneVerificationActions({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    return Column(
      children: [
        ResendOtpButton(
          resendText: S.of(context).phoneVerificationResend,
          onResend: () {
            context.read<PhoneVerifyCubit>().verifyPhoneResendCode();
          },
        ),
        SizedBox(height: AppSizes.h16),
        BlocBuilder<PhoneVerifyCubit, PhoneVerifyState>(
          builder: (context, state) {
            return CustomButton(
              isLoading: state is PhoneVerifyLoading,
              text: S.of(context).next,
              onPressed: () {
                context.read<PhoneVerifyCubit>().verifyPhoneConfirm();
              },
            );
          },
        ),
        SizedBox(height: AppSizes.h16),
        CustomButton(
          borderColor: colors.primary,
          textColor: colors.primary,
          backgroundColor: Colors.transparent,
          text: S.of(context).skipForNow,
          onPressed: () {
            context.pushReplacementNamed(AppRoutes.main);
          },
        ),
      ],
    );
  }
}
