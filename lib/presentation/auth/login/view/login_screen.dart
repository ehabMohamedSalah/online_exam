import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/routes_manager.dart';
import 'package:online_exam/presentation/auth/login/view_model/login_view_model_cubit.dart';
import '../../../../core/constant.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resuable-comp/app_bar.dart';
import '../../../../core/resuable-comp/custom_text_field.dart';
import '../../../../core/resuable-comp/text_button.dart';
import '../../../../core/utils/string_manager.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailContrller;
  late TextEditingController passwordController;
  bool rememberMe = false; // الحالة الافتراضية
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginViewModelCubit viewModel= getIt<LoginViewModelCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>  getIt<LoginViewModelCubit>(),
       child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  AppBarWidget(
                    onpressed: () {},
                  ),
                  SizedBox(
                    height: 20.h,
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
                    height: 20.h,
                  ),
                  CustomTextField(
                      labelText: StringManager.password,
                      hintText: StringManager.enterYourPassowrd,
                      controller: passwordController,
                      keyboard: TextInputType.visiblePassword,
                      validator: (value) {
                        if ((value?.length ?? 0) < 7) {
                          return StringManager.notValidPass;
                        }
                      },
                      obscureText: false),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (bool? newValue) {
                              setState(() {
                                rememberMe = newValue ?? false;
                              });
                            },
                          ),
                          SizedBox(
                              width: 8.w), // إضافة مسافة صغيرة بين المربع والنص
                          Text(
                            StringManager.rememberMe,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Text(
                        StringManager.forgetPass,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
              BlocConsumer<LoginViewModelCubit, LoginViewModelState>(
                listener: (context, state) {
                  switch (state.runtimeType) {
                    case LoginSuccess:
                      Fluttertoast.showToast(
                        msg: "✅ Login Success!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteManager.homeScreen, (route) => false);
                      break;
                    case LoginErorr:
                      String errorMessage = "❌ Login failed!";

                      if ((state as LoginErorr).exp.exception.toString().contains("Unauthorized")) {
                        errorMessage = "🔴 Invalid credentials! Please try again.";
                      }

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
                    case Loginloading:
                      return CircularProgressIndicator();
                    default:
                      return CustomTextButton(
                        text: StringManager.login,
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            LoginViewModelCubit.get(context).login(
                              email: emailContrller.text,
                              password: passwordController.text,
                            );
                          } else {
                            print("❌ Please enter correct data");
                          }
                        },
                      );
                  }
                },
              ),



                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringManager.dontHaveAnAcc,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        StringManager.signUp,
                        style: TextStyle(
                            color: ColorManager.primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
