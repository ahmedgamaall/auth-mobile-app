import 'package:auth_mobile_app/features/profile/logic/profile_cubit.dart';
import 'package:auth_mobile_app/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/core/di/dependency_injection.dart';
import 'package:auth_mobile_app/core/routing/routes.dart';
import 'package:auth_mobile_app/features/login/logic/login_cubit.dart';
import 'package:auth_mobile_app/features/login/ui/login_screen.dart';
import 'package:auth_mobile_app/features/register/logic/register_cubit.dart';
import 'package:auth_mobile_app/features/register/ui/register_screen.dart';

/// Manage Routes
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<RegisterCubit>(),
                child: const RegisterScreen(),
              ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );

      case Routes.profileScreen:

        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) => getIt<ProfileCubit>()
                    ..getProfileInfo(),
                    child: const ProfileScreen(),
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  Scaffold(body: Text('No route defined for ${settings.name}')),
        );
    }
  }
}
