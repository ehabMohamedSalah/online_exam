import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';

class DialogHelper {
  static void showFinishDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset("assets/images/sand-clock 1.png"),
            ),
             const Text(
              "Time Out !!",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ],
        ),
        actions: [
          CustomTextButton(
            textColor: Colors.white,
            color: ColorManager.primaryColor,
            onPressed: () => Navigator.pop(context), // ✅ Pass as a function
            text: "View Score",
          ),
        ],
      ),
    );
  }

}
