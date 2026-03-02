import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/sign_up/signup_view_body.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/extensions/navigation_extension.dart';
import 'package:quent/core/routing/app_route.dart';

class SignupViewBodyBlocListener extends StatelessWidget {
  const SignupViewBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignUpSuccessAndPhoneVerifyCodeSent) {
          context.pushReplacementNamed(
            AppRoutes.phoneVerification,
            arguments:{
              'phone': context.read<SignupCubit>().phoneController.text.trim(),
              'code': state.verifyPhoneResponseModel.code
            } ,

          );
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( state.verifyPhoneResponseModel.code ),duration: Duration(seconds: 30),));

         
        }
        if (state is SignupFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( state.error.message)));
        }
      },

      child: const SignupViewBody(),
    );
  }
}
