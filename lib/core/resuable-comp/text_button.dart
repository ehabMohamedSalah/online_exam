import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class CustomTextButton extends StatelessWidget {

  String text;
  void Function()? onPressed;
  CustomTextButton({required this.onPressed,required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style:ElevatedButton.styleFrom(backgroundColor: ColorManager.primaryColor) ,
          onPressed: onPressed,
          child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16))),
    );

  }
}
