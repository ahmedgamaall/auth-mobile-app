import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/core/helpers/extensions.dart';
import 'package:auth_mobile_app/features/login/logic/login_cubit.dart';
import 'package:auth_mobile_app/features/login/logic/login_state.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is LoadingLoginState ||
              current is SuccessLoginState ||
              current is ErrorLoginState,
      listener: (context, state) {
        if (state is SuccessLoginState) {
          context.pop();
          context.pushNamed(Routes.profileScreen);
        } else if (state is ErrorLoginState) {
          // setupErrorState(context, state.message);
        }

        showDialog(
          context: context,
          builder:
              (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.blue,
                ),
              ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}