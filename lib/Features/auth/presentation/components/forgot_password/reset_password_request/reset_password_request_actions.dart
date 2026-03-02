// widgets/reset_password_request_actions.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/custom_button.dart';
import 'package:quent/generated/l10n.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';

class ResetPasswordRequestActions extends StatelessWidget {
  const ResetPasswordRequestActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordFlowCubit>();
    return Column(
      children: [
        BlocBuilder<ForgotPasswordFlowCubit, ForgotPasswordFlowState>(
          builder: (context, state) {
            return CustomButton(
              isLoading: state is Loading,
              text: S.of(context).submit,
              onPressed: cubit.forgotPasswordRequest,
            );
          },
        ),
        SizedBox(height: AppSizes.h32),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).backToLogin),
        ),
      ],
    );
  }
}
