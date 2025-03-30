import 'package:auth_mobile_app/core/helpers/constants.dart';
import 'package:auth_mobile_app/core/helpers/extensions.dart';
import 'package:auth_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:auth_mobile_app/core/routing/routes.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/widgets/app_button.dart';
import 'package:auth_mobile_app/features/profile/ui/widgets/avatar_bloc_builder.dart';
import 'package:auth_mobile_app/features/profile/ui/widgets/info_form_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AvatarBlocBuilder(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  children: [
                    const InfoFormBlocBuilder(),
                    verticalSpace(20),
                    AppButton(
                      buttonText: "Logout",
                      backgroundColor: ColorsManager.red,
                      onPressed: () {
                        logout(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logout(BuildContext context) async {
    await SharedPrefHelper.clearAllData();
    rememberMe = false;
    context.pushNamedAndRemoveUntil(
      Routes.loginScreen,
      predicate: (route) => false,
    );
  }
}
