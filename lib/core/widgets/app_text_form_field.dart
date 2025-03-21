import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final bool? isObscureText;
  final bool? enabled;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const AppTextFormField({
    super.key,
    required this.labelText,
    this.enabled,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyles.font14Gray400),
        verticalSpace(4),
        TextFormField(
          enabled: enabled ?? true,
          controller: controller,
          keyboardType: keyboardType,
          cursorColor: ColorsManager.black,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.gray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.gray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.gray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            suffixIcon: suffixIcon,
          ),
          obscureText: isObscureText ?? false,
          style: TextStyles.font14Black400,
          validator: validator,
        ),
      ],
    );
  }
}
