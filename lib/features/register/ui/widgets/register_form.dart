import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/core/helpers/app_regex.dart';
import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/widgets/app_text_form_field.dart';
import 'package:auth_mobile_app/features/register/logic/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordObscureText = true;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
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
                      context.read<RegisterCubit>().usernameController.clear();
                    },
                  ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid username';
              }
              return null;
            },
            controller: context.read<RegisterCubit>().usernameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: InkWell(
                    child: const Icon(
                      CupertinoIcons.xmark_circle,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      context.read<RegisterCubit>().emailController.clear();
                    },
                  ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: context.read<RegisterCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            labelText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
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
