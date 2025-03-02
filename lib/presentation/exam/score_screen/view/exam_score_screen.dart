import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/resuable-comp/app_bar.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/presentation/exam/score_screen/view/widget/score_reslt_widet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScoreScreen extends StatefulWidget {
  ExamScoreScreen({super.key});

  @override
  State<ExamScoreScreen> createState() => _ExamScoreScreenState();
}

class _ExamScoreScreenState extends State<ExamScoreScreen> {
  String? reslt;
  String? correctReslt;
  String? incorrectReslt;
  double? percent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(
              onpressed: () {},
              title: StringManager.examScore,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              StringManager.yourScore,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 6,
                  percent: percent ?? 0.0,
                  center: Text(reslt ?? "0%",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  progressColor: ColorManager.primaryColor,
                  backgroundColor: ColorManager.failureColor,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ScoreResltWidet(
                      title: StringManager.correct,
                      reslt: correctReslt ?? "0",
                      color: ColorManager.primaryColor,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ScoreResltWidet(
                      title: StringManager.inCorrect,
                      reslt: incorrectReslt ?? "0",
                      color: ColorManager.failureColor,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            CustomTextButton(
              onPressed: () {},
              text: StringManager.showResults,
              color: ColorManager.primaryColor,
              textColor: ColorManager.backgroundOTP,
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextButton(
              onPressed: () {},
              text: StringManager.startAgain,
              color: Colors.white,
              textColor: ColorManager.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
