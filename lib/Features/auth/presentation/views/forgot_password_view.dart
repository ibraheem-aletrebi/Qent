import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/components/forgot_password/forgot_password_flow_bloc_listener.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/injector.dart';
import 'package:quent/core/resources/app_sizes.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordFlowCubit>(
      create: (context) => sl<ForgotPasswordFlowCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.w16),
            child: ForgotPasswordFlowBlocListener(),
          ),
        ),
      ),
    );
  }
}
