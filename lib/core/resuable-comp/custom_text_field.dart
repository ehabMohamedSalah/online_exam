import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboard;
  String labelText;
  String hintText;
  bool obscureText;
  String? Function(String?)? validator;
  CustomTextField({required this.labelText ,required this.hintText,required this.controller,required this.keyboard,required this.validator,required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
        keyboardType:keyboard ,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle:  Theme.of(context).textTheme.labelSmall,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4 ,),
            borderSide: BorderSide(style: BorderStyle.none,width: 4,color: Color(0xff535353,)),
          )
        ),
    );
  }
}
