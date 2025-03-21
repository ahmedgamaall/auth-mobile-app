import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';

class AppButton extends StatelessWidget {
  final Color? backgroundColor;
  final String buttonText;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    this.backgroundColor,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorsManager.blue,
        ),
        elevation: const WidgetStatePropertyAll(5),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 80.w, vertical: 12.h),
        ),
        fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 50.h)),
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: TextStyles.font14White700),
    );
  }
}
