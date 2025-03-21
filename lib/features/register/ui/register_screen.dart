import 'package:auth_mobile_app/core/widgets/app_button.dart';
import 'package:auth_mobile_app/core/widgets/logo_banner.dart';
import 'package:auth_mobile_app/core/widgets/remember_me_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';
import 'package:auth_mobile_app/features/register/ui/widgets/register_bloc_listener.dart';
import 'package:auth_mobile_app/features/register/ui/widgets/register_form.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/register_cubit.dart';
import 'widgets/already_have_account_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LogoBanner(),
              verticalSpace(100),
              Text(
                'Create new account',
                style: TextStyles.font20Black700,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  children: [
                    const RegisterForm(),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RememberMeCheckBox(),
                        AppTextButton(
                          buttonText: 'Have a problem?',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    AppButton(
                      buttonText: "Register",
                      onPressed: () {
                        validateThenDoRegister(context);
                      },
                    ),
                    verticalSpace(20),
                    const AlreadyHaveAccountText(),
                    const RegisterBlocListener(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterStates();
    }
  }
}
