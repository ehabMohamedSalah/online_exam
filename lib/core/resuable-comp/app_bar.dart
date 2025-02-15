import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/string_manager.dart';

class AppBarWidget extends StatelessWidget {
   void Function()? onpressed;
   String title;
   AppBarWidget({required this.onpressed, required  this.title});
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        IconButton(
          onPressed: onpressed,
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 25,) ,

        ),
        Text(title??"",style:  Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black),),

      ],
    );

  }
}
