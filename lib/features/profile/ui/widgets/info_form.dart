import 'package:auth_mobile_app/features/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/core/helpers/app_regex.dart';
import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:auth_mobile_app/core/widgets/app_text_form_field.dart';

class InfoForm extends StatelessWidget { 

  const InfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ProfileCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            labelText: 'Username',
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid username';
              }
              return null;
            },
            controller: context.read<ProfileCubit>().usernameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: context.read<ProfileCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Gender',
            keyboardType: TextInputType. text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: context.read<ProfileCubit>().genderController,
          ),
        ],
      ),
    );
  }

}
