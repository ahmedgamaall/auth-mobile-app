import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auth_mobile_app/core/di/dependency_injection.dart';
import 'package:auth_mobile_app/core/helpers/constants.dart';
import 'package:auth_mobile_app/core/helpers/custom_observer.dart';
import 'package:auth_mobile_app/core/helpers/extensions.dart';
import 'package:auth_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:auth_mobile_app/core/routing/app_router.dart';
import 'package:auth_mobile_app/auth_mobile_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDi();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await checkIfLoggedInUser();
  Bloc.observer = CustomBlocObserver();
  await ScreenUtil.ensureScreenSize();
  runApp(AuthMobileApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.accessToken,
  );
  rememberMe = await SharedPrefHelper.getBool(
    SharedPrefKeys.rememberMe,
  ) ?? false;
  if (!userToken.isNullOrEmpty()) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
