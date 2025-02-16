import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/presentation/auth/forget_password/confirm_password/view/forgetpassword_screen_view.dart';
import 'package:online_exam/presentation/auth/forget_password/email_screen/view/email_screen_view.dart';
import 'package:online_exam/presentation/auth/forget_password/verify_code/view/otp_screen_view.dart';
import 'package:online_exam/presentation/auth/login/view/login_screen.dart';
import 'package:online_exam/presentation/home/view/homeSceen.dart';

import 'config/theme/app_theme.dart';
import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'core/utils/routes_manager.dart';

void main() {
  ApiManager.init();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:   Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return     MaterialApp(
          debugShowCheckedModeBanner: false,
          routes:{
            RouteManager.homeScreen:(context) => HomeScreen(),
            RouteManager.loginScreen:(context) => LoginScreen(),
            RouteManager.emailScreen:(context) => EmailScreen(),
            RouteManager.forgetPassScreen:(context) => ForgetpasswordScreen(),
            RouteManager.otpScreen:(context) => OtpScreen(),
          },
          initialRoute:  RouteManager.loginScreen ,
          theme:AppTheme.lightTheme ,


        );
      },
    ) ;
  }
}

