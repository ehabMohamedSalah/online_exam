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
import 'package:online_exam/presentation/home/tabs/profile_tab/change_password/view_model/new_password_view_model_cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String oldPassword;

  ChangePasswordScreen(this.oldPassword);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController oldPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    oldPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    oldPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => getIt<NewPasswordViewModelCubit>(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarWidget(
                  onpressed: () {
                    Navigator.pop(context, true);
                  },
                  title: StringManager.resetPassword,
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  labelText: StringManager.currentPassword,
                  hintText: StringManager.currentPassword,
                  obscureText: true,
                  controller: oldPasswordController,
                  keyboard: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringManager.invalidPassword;
                    }
                    if (!Constant.regexPass.hasMatch(value)) {
                      return StringManager.invalidPassword;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.h),
                CustomTextField(
                  labelText: StringManager.newPassword,
                  hintText: StringManager.newPassword,
                  obscureText: true,
                  controller: newPasswordController,
                  keyboard: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringManager.invalidPassword;
                    }
                    if (!Constant.regexPass.hasMatch(value)) {
                      return StringManager.invalidPassword;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.h),
                CustomTextField(
                  labelText: StringManager.confirmPassword,
                  hintText: StringManager.confirmPassword,
                  obscureText: true,
                  controller: confirmPasswordController,
                  keyboard: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringManager.confirmPasswordCannotBeEmpty;
                    }
                    if (value != newPasswordController.text) {
                      return StringManager.passwordNotMatched;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 48.h),
                BlocConsumer<NewPasswordViewModelCubit, NewPasswordViewModelState>(
                  listener: (context, state) {
                    if (state is NewPasswordSuccess) {
                      Fluttertoast.showToast(
                        msg: "✅ Password Changed!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                      Navigator.pushNamed(context, RouteManager.homeScreen);
                    } else if (state is NewPasswordErorr) {
                      String errorMessage = state.exp.exception.toString();
                      Fluttertoast.showToast(
                        msg: errorMessage,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is NewPasswordloading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomTextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          NewPasswordViewModelCubit.get(context).ChangePassword(
                            token: oldPasswordController.text,
                            message: confirmPasswordController.text,
                          );
                          Navigator.pop(context, true);
                        }
                      },
                      text: 'Update',
                      color: ColorManager.primaryColor,
                      textColor: ColorManager.backgroundBottomNavBar,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
