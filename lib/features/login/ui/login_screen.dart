import 'package:auth_mobile_app/core/widgets/app_button.dart';
import 'package:auth_mobile_app/core/widgets/logo_banner.dart';
import 'package:auth_mobile_app/core/widgets/remember_me_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/features/login/logic/login_cubit.dart';
import 'package:auth_mobile_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/username_and_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                'Login in to your account',
                style: TextStyles.font20Black700,
                textAlign: TextAlign.center,
              ),
              verticalSpace(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  children: [
                    const UsernameAndPassword(),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RememberMeCheckBox(),
                        AppTextButton(
                          buttonText: 'Forgot Password?',
                          onPressed: () {
                            validateThenDoLogin(context);
                          },
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    AppButton(
                      buttonText: 'Login',
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(20),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
