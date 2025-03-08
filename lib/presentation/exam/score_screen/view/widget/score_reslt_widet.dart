import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreResltWidet extends StatelessWidget {
  String title;
  String reslt;
  Color color;

  ScoreResltWidet(
      {super.key,
      required this.title,
      required this.reslt,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: color),
        ),
        SizedBox(
          width: 70.w,
        ),
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: color, width: 1)),
          child: Center(
            child: Text(reslt,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: color),textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}
