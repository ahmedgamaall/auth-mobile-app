import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:auth_mobile_app/core/helpers/extensions.dart';
import 'package:auth_mobile_app/core/routing/routes.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Already have an account?', style: TextStyles.font14Black400),
        horizontalSpace(4),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.loginScreen);
          },
          child: Text('Login', style: TextStyles.font14Black700.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ColorsManager.blue,
            ),),
        ),
      ],
    );
  }
}
