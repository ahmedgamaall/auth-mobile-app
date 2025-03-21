import 'package:auth_mobile_app/core/helpers/constants.dart' show rememberMe;
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({super.key});

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: ColorsManager.blue,
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = !rememberMe;
            });
          },
        ),
        Text('Remember me', style: TextStyles.font14Black700),
      ],
    );
  }
}
