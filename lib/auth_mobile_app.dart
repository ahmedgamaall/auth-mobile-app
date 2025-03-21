import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auth_mobile_app/core/routing/app_router.dart';
import 'package:auth_mobile_app/core/routing/routes.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/helpers/constants.dart';

class AuthMobileApp extends StatelessWidget {
  const AuthMobileApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Auth Mobile App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
          primaryColor: ColorsManager.black,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute:
            isLoggedIn && rememberMe
                ? Routes.profileScreen
                : Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
