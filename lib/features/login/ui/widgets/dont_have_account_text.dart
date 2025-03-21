import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:auth_mobile_app/core/helpers/extensions.dart';
import 'package:auth_mobile_app/core/routing/routes.dart';

import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Don\'t have an account?', style: TextStyles.font14Black400),
        horizontalSpace(4),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.signupScreen);
          },
          child: Text(
            'Register',
            style: TextStyles.font14Black700.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ColorsManager.blue,
            ),
          ),
        ),
      ],
    );
  }
}
