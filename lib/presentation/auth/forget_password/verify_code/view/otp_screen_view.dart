import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/resuable-comp/app_bar.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/routes_manager.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/presentation/auth/login/view_model/login_view_model_cubit.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                  Navigator.pushNamed(context, RouteManager.emailScreen);
                }, title: StringManager.password,
              ),
              SizedBox(
                height: 40.h,
              ),
              const Text(
                "Email verification",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorManager.labelLarge,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16.h,
              ),
              const Text(
                "Please enter your code that send to your \nemail address ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: ColorManager.greyColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 32.h,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: ColorManager.backgroundOTP,
                fillColor: ColorManager.backgroundOTP,
                enabledBorderColor: ColorManager.backgroundOTP,
                disabledBorderColor: ColorManager.failureColor,
                filled: true,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                fieldWidth: 52.w,
                fieldHeight: 52.h,
                borderWidth: 2,
                mainAxisAlignment: MainAxisAlignment.center,
                margin: EdgeInsets.symmetric(vertical: 24.h, horizontal: 5.5.w),
                showFieldAsBox: true,
                onSubmit: (String verificationCode) {
                  Navigator.pushNamed(context, RouteManager.forgetPassScreen);
                }, // end onSubmit
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive code?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.labelLarge),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Text(
                    "Resend",
                    style: TextStyle(
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
