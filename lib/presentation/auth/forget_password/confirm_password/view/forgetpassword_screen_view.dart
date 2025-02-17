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

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController newPasswordContrller;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newPasswordContrller = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => getIt<LoginViewModelCubit>(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarWidget(
                  onpressed: () {
                    Navigator.pushNamed(context, RouteManager.otpScreen);
                  },
                  title: StringManager.password,
                ),
                SizedBox(
                  height: 40.h,
                ),
                const Text(
                  "Reset password",
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorManager.labelLarge,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Text(
                  "Password must not be empty and must contain 6 characters with upper case letter and one number at least ",
                  overflow: TextOverflow.visible,
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
                  labelText: StringManager.newPassword,
                  hintText: StringManager.enterYourNewPassword,
                  obscureText: false,
                  controller: newPasswordContrller,
                  keyboard: TextInputType.visiblePassword,
                  validator: (value) {
                    if (!Constant.regexPass.hasMatch(value ?? "")) {
                      return StringManager.notValidEmail;
                    }
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomTextField(
                  labelText: StringManager.confirmPassword,
                  hintText: StringManager.confirmPassword,
                  obscureText: false,
                  controller: confirmPasswordController,
                  keyboard: TextInputType.visiblePassword,
                  validator: (value) {
                    if (!Constant.regexPass.hasMatch(value ?? "")) {
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
                      RouteManager.loginScreen,
                    );
                  },
                  text: 'Continue',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
