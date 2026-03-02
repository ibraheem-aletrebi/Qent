import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/phone_verification/phone_verification_view_body.dart';
import 'package:quent/Features/auth/presentation/cubits/phone_verify/phone_verify_cubit.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/routing/app_route.dart';

class PhoneVerificationViewBodyBlocListener extends StatelessWidget {
  const PhoneVerificationViewBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneVerifyCubit, PhoneVerifyState>(
      listener: (context, state) {
        if (state is PhoneVerifyCodeVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.phoneVerifiedResponseModel.message)),
          );

          context.pushReplacementNamed(AppRoutes.main);
        }
        if (state is PhoneVerifyResendCode) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.verifyPhoneResponseModel.code),
              duration: Duration(seconds: 30),
            ),
          );
        }
        if (state is PhoneVerifyError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorModel.message)));
        }
      },
      child: const PhoneVerificationViewBody(),
    );
  }
}
