import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/features/login/logic/login_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class UsernameAndPassword extends StatefulWidget {
  const UsernameAndPassword({super.key});

  @override
  State<UsernameAndPassword> createState() => _UsernameAndPasswordState();
}

class _UsernameAndPasswordState extends State<UsernameAndPassword> {
  bool isObscureText = true;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextFormField(
            labelText: 'Username',
            keyboardType: TextInputType.name,
            suffixIcon: InkWell(
              child: const Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.grey,
              ),
              onTap: () {
                context.read<LoginCubit>().usernameController.clear();
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid username';
              }
              return null;
            },
            controller: context.read<LoginCubit>().usernameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            labelText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.gray,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
