import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import '../../../../core/constant.dart';
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

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     emailContrller = TextEditingController();
     passwordController = TextEditingController();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding:   REdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                AppBarWidget( onpressed: ( ) {},),
                SizedBox(height: 20.h,),
                CustomTextField(
                  labelText: StringManager.email,
                  hintText: StringManager.enterYourEmail,
                  obscureText: true,
                  controller: emailContrller,
                  keyboard: TextInputType.emailAddress,
                  validator: (value){
                    if (!Constant.regexEmail.hasMatch(value ?? "")) {
                      return StringManager.notValidEmail;
                    }
                  },

                ),
                SizedBox(height: 20.h,),
                CustomTextField(
                    labelText: StringManager.password,
                    hintText: StringManager.enterYourPassowrd,
                    controller: passwordController,
                    keyboard: TextInputType.visiblePassword,
                    validator: (value){
                      if ((value?.length ?? 0) < 7) {
                        return StringManager.notValidPass;
                      }
                    },
                    obscureText: true
                ),
                SizedBox(height: 20.h,),
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
                        SizedBox(width: 8.w), // إضافة مسافة صغيرة بين المربع والنص
                        Text(StringManager.rememberMe,style: Theme.of(context).textTheme.bodyMedium,),
                      ],
                    ),
                    Text(StringManager.forgetPass,style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline,decorationThickness: 2.0),)
                  ],
                ),
                SizedBox(height: 50.h,),
                CustomTextButton(
                  text: StringManager.login,
                  onPressed: (){
                    if (formKey.currentState?.validate() == true) {
                      // ✅ if data is correct
                     // SignInViewModel.get(context).SignIn(Email: emailContrller.text, password: passwordController.text);

                    } else {
                      // ❌  law fshlt
                      print("please enter a correct data");
                    }
                  }),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringManager.dontHaveAnAcc,style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(width: 5.w,),
                    Text(StringManager.signUp,style: TextStyle(color: ColorManager.primaryColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationThickness: 2.0),),

                  ],
                )
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
