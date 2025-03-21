import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/core/helpers/extensions.dart';
import 'package:auth_mobile_app/core/routing/routes.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';
import 'package:auth_mobile_app/features/register/logic/register_cubit.dart';
import 'package:auth_mobile_app/features/register/logic/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen:
          (previous, current) =>
              current is LoadingRegisterState ||
              current is SuccessRegisterState ||
              current is ErrorRegisterState,
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          context.pop();
          showSuccessDialog(context);
        } else if (state is ErrorRegisterState) {
          setupErrorState(context, state.message);
        }

        showDialog(
          context: context,
          builder:
              (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManager.blue),
              ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsManager.blue,
          title: Text('Register Successful', style: TextStyles.font14Black700),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Congratulations, you have signed up successfully!',
                  style: TextStyles.font14Black400,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.blue,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushNamed(Routes.profileScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String message) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: ColorsManager.blue,
            icon: const Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(message, style: TextStyles.font14Black400),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Got it', style: TextStyles.font14Black700),
              ),
            ],
          ),
    );
  }
}
