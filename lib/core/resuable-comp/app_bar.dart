import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/string_manager.dart';

class AppBarWidget extends StatelessWidget {
   void Function()? onpressed;
   AppBarWidget({required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        IconButton(
          onPressed: onpressed,
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 25,) ,

        ),
        Text(StringManager.login,style:  Theme.of(context).textTheme.labelLarge,),

      ],
    );

  }
}
