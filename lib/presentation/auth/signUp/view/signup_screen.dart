import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam/core/resuable-comp/custom_text_field.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/presentation/auth/signUp/view_Model/signup_view_model_cubit.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resuable-comp/app_bar.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/routes_manager.dart';

class Signupscreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextInputType textInputType = TextInputType.text;
  TextInputType emailInputType = TextInputType.emailAddress;
  TextInputType phoneInputType = TextInputType.phone;

  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<SignupViewModelCubit>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBarWidget(
                    onpressed: () {
                      Navigator.pop(context);
                    },
                    title: "signUp",
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomTextField(
                    labelText: "User name",
                    hintText: "Enter your user name",
                    controller: usernameController,
                    keyboard: textInputType,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'This user name is not valid';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "First name",
                          hintText: "Enter first name",
                          controller: firstNameController,
                          keyboard: textInputType,
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'This first name is not valid';
                            }
                            return null;
                          },
                          obscureText: false,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Last name",
                          hintText: "Enter last name",
                          controller: lastNameController,
                          keyboard: textInputType,
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'This last name is not valid';
                            }
                            return null;
                          },
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    labelText: "Email",
                    hintText: "Enter your email",
                    controller: emailController,
                    keyboard: emailInputType,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'This email is not valid';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Password",
                          hintText: "Enter password",
                          controller: passwordController,
                          keyboard: textInputType,
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'This password is not valid';
                            }
                            password = data;
                            return null;
                          },
                          obscureText: true,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Confirm password",
                          hintText: "Confirm password",
                          controller: rePasswordController,
                          keyboard: textInputType,
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'Confirm password is not valid';
                            }
                            if (data != password) {
                              return 'Password not matched';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    labelText: "Phone number",
                    hintText: "Enter phone number",
                    controller: phoneController,
                    keyboard: phoneInputType,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'This phone number is not valid';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  BlocConsumer<SignupViewModelCubit, SignupViewModelState>(
                    listener: (context, state) {
                      if (state is SignupSuccess) {
                        Fluttertoast.showToast(
                          msg: "Signup is Success",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteManager.homeScreen, (route) => false);
                      }
                      if (state is SignupErorr) {
                        Fluttertoast.showToast(
                          msg: state.ErrorMessage,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is Signuploading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return CustomTextButton(
                        text: StringManager.signUp,
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            SignupViewModelCubit.get(context).Signup(
                              password: passwordController.text,
                              email: emailController.text,
                              username: usernameController.text,
                              phone: phoneController.text,
                              lastName: lastNameController.text,
                              firstName: firstNameController.text,
                              rePassword: rePasswordController.text,
                            );
                          } else {
                            print("please enter a correct data");
                          }
                        },
                        color: ColorManager.primaryColor,
                        textColor: ColorManager.backgroundBottomNavBar,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorManager.primaryColor,
                              // Optional: Change underline color
                              decorationThickness: 1.0,
                              color: ColorManager.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
