import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/resuable-comp/app_bar.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/data/model/exam/check_question/check_question_response.dart';
import 'package:online_exam/presentation/exam/score_screen/view/widget/score_reslt_widet.dart';
import 'package:online_exam/presentation/exam/score_screen/view_model/score_view_model_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScoreScreen extends StatefulWidget {
  final String qId;

  ExamScoreScreen({super.key, required this.qId});

  @override
  State<ExamScoreScreen> createState() => _ExamScoreScreenState();
}

class _ExamScoreScreenState extends State<ExamScoreScreen> {
  late CheckQuestionResponse checkQuestionResponse = CheckQuestionResponse();

  GlobalKey<FormState> formKey = GlobalKey();

  String? total;
  String? correct;
  String? wrong;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ScoreViewModelCubit>().postCheckQuestion(
            correct: checkQuestionResponse.correct ?? 0,
            wrong: checkQuestionResponse.wrong ?? 0,
            total: checkQuestionResponse.total ?? "0");
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<ScoreViewModelCubit>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                onpressed: () {
                  Navigator.pop(context);
                },
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
                    center: Text(total ?? "0%",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    progressColor: ColorManager.primaryColor,
                    backgroundColor: ColorManager.failureColor,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ScoreResltWidet(
                        title: StringManager.correct,
                        reslt: correct ?? "0",
                        color: ColorManager.primaryColor,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ScoreResltWidet(
                        title: StringManager.inCorrect,
                        reslt: wrong ?? "0",
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
                onPressed: () {
                  ///هنا المفروض يروح علي result
                },
                text: StringManager.showResults,
                color: ColorManager.primaryColor,
                textColor: ColorManager.backgroundOTP,
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextButton(
                onPressed: () {
                  ///هنا المفروض يروح علي exam تاني
                },
                text: StringManager.startAgain,
                color: Colors.white,
                textColor: ColorManager.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
