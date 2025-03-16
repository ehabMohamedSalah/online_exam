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
import 'core/local_storage/exam_result_storage.dart';
import 'core/utils/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  ApiManager.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> getInitialRoute() async {
    bool isRemembered = await ExamResultsStorage.isUserRemembered();
    return isRemembered ? RouteManager.homeScreen : RouteManager.loginScreen;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return FutureBuilder<String>(
          future: getInitialRoute(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return MaterialApp(
                home: Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
              );
            }

            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => ImageProviderModel()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  RouteManager.homeScreen: (context) => HomeScreen(),
                  RouteManager.loginScreen: (context) => LoginScreen(),
                  RouteManager.forgetPassScreen: (context) => ForgetPasswordScreen(),
                  RouteManager.signUpscreen: (context) => Signupscreen(),
                },
                initialRoute: snapshot.data,
                theme: AppTheme.lightTheme,
              ),
            );
          },
        );
      },
    );
  }
}
