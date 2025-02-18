import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam/core/constant.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/resuable-comp/app_bar.dart';
import 'package:online_exam/core/resuable-comp/custom_text_field.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/routes_manager.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart';

import '../../verify_otp_code/view/otp_screen_view.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
        create: (BuildContext context) => getIt<ForgetPasswordViewModelCubit>(),
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
              BlocConsumer<ForgetPasswordViewModelCubit,ForgetPasswordViewModelState>(
                listener: (context, state) {
                  switch (state.runtimeType) {
                    case ForgetPasswordSuccess:
                      Fluttertoast.showToast(
                        msg: "✅ otp send to your email!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen( emailContrller.text),
                        ),
                      );

                      break;
                    case ForgetPasswordErorr:
                      String errorMessage =(state as ForgetPasswordErorr).exp.exception.toString();
                      Fluttertoast.showToast(
                        msg: errorMessage,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                      break;
                  }
                },
                builder: (context, state) {
                        switch (state) {
                            case ForgetPasswordloading:
                            return CircularProgressIndicator();
                            default:
                                return CustomTextButton(
                                      onPressed: () {
                                     ForgetPasswordViewModelCubit.get(context).ForgetPassword(email:emailContrller.text);
                                      },
                                      text: 'Continue',
                                );

                        }})
            ],
          ),
        ),
      ),
    );
  }
}
