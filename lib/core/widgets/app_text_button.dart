import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyles.font14Black700.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: ColorsManager.blue,
        ),
      ),
    );
  }
}
