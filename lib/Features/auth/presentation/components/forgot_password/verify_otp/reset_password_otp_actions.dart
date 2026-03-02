import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/resend_otp_button.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_button.dart';
import 'package:quent/generated/l10n.dart';

class ResetPasswordOtpActions extends StatelessWidget {
  const ResetPasswordOtpActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordFlowCubit>();

    return Column(
      children: [
        BlocBuilder<ForgotPasswordFlowCubit, ForgotPasswordFlowState>(
          bloc: cubit,
          builder: (context, state) {
            return CustomButton(
              isLoading: state is Loading,
              text: S.of(context).next,
              onPressed: () {
                cubit.verifyOtp();
              },
            );
          },
        ),
        SizedBox(height: AppSizes.h32),
        ResendOtpButton(
          resendText: S.of(context).resetPasswordOtpResend,
          onResend: cubit.resendOtp,
        ),
      ],
    );
  }
}
