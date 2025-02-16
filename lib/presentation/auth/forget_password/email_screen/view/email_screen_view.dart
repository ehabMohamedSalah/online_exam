import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/constant.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/resuable-comp/app_bar.dart';
import 'package:online_exam/core/resuable-comp/custom_text_field.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/routes_manager.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/presentation/auth/login/view_model/login_view_model_cubit.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  late TextEditingController emailContrller;
  bool rememberMe = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => getIt<LoginViewModelCubit>(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarWidget(
                onpressed: () {
                  Navigator.pushNamed(context, RouteManager.loginScreen);
                }, title: StringManager.password,
              ),
              SizedBox(
                height: 40.h,
              ),
              const Text(
                "Forget password",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorManager.labelLarge,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16.h,
              ),
              const Text(
                "Please enter your email associated \nto your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: ColorManager.greyColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomTextField(
                labelText: StringManager.email,
                hintText: StringManager.enterYourEmail,
                obscureText: false,
                controller: emailContrller,
                keyboard: TextInputType.emailAddress,
                validator: (value) {
                  if (!Constant.regexEmail.hasMatch(value ?? "")) {
                    return StringManager.notValidEmail;
                  }
                },
              ),
              SizedBox(
                height: 48.h,
              ),
              CustomTextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteManager.otpScreen,
                  );
                },
                text: 'Continue',
              )
            ],
          ),
        ),
      ),
    );
  }
}
