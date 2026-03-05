import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/forgot_password_flow.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/routing/app_route.dart';
import 'package:quent/generated/l10n.dart';

class ForgotPasswordFlowBlocListener extends StatelessWidget {
  const ForgotPasswordFlowBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordFlowCubit, ForgotPasswordFlowState>(
      listener: (context, state) {
        if (state is Failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMode.message)));
        }
        if (state is OtpVerificationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).otpIsNotCorrect)),
          );
        }
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).passwordChangedSuccessfully)),
          );

          context.pushReplacementNamed(AppRoutes.login);
        }
      },
      child: ForgotPasswordFlow(),
    );
  }
}
