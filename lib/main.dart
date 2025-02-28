import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/data/model/profile_tab/image_provider_model.dart';
import 'package:online_exam/presentation/auth/forget_password/forget_password/view/forget_screen_view.dart';
import 'package:online_exam/presentation/auth/login/view/login_screen.dart';
import 'package:online_exam/presentation/auth/signUp/view/signup_screen.dart';
import 'package:online_exam/presentation/home/view/homeSceen.dart';
import 'package:provider/provider.dart';

import 'config/theme/app_theme.dart';
import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'core/utils/routes_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiManager.init();
  configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ImageProviderModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            RouteManager.homeScreen: (context) => HomeScreen(),
            RouteManager.forgetPassScreen: (context) => ForgetPasswordScreen(),
            RouteManager.loginScreen: (context) => LoginScreen(),
            RouteManager.signUpscreen: (context) => Signupscreen(),
          },
          initialRoute: RouteManager.homeScreen,
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}

