import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/local_storage/exam_result_storage.dart';
import 'package:online_exam/core/resuable-comp/app_bar.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/presentation/exam/score_screen/view/widget/score_reslt_widet.dart';
import 'package:online_exam/presentation/exam/score_screen/view_model/score_view_model_cubit.dart';
import 'package:online_exam/presentation/home/tabs/result_tab/answer_screen/answer_screen.dart';
import 'package:online_exam/presentation/home/view/homeSceen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../data/model/get_all_exam_onsubject_response/Exams.dart';
import '../../../../data/model/question_on_exam/Questions.dart';
import '../../../../data/model/result_model/result_model_response.dart';
import '../../../home/tabs/explore_tab/quiz_screen/view/quiz_screen.dart';

class ExamScoreScreen extends StatelessWidget {
  final List<Map<String, String>> answers;
  final int time;
  String examID;
  Exams exam;
  List<Questions> questions;

  ExamScoreScreen(
      {required this.answers,
      required this.time,
      required this.examID,
      required this.exam,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ScoreViewModelCubit>()
        ..postCheckQuestion(answers: answers, time: time),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                onpressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen())),
                title: StringManager.examScore,
              ),
              SizedBox(height: 40.h),
              Text(
                StringManager.yourScore,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(height: 24.h),

              // BlocBuilder لمراقبة حالة البيانات
              BlocBuilder<ScoreViewModelCubit, ScoreViewModelState>(
                builder: (context, state) {
                  if (state is Scoreloading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ScoreSuccess) {
                    print(questions.length);
                    final examResult = ExamResultModel(
                      questions: questions,
                      exam: exam,
                      examID: examID,
                      // استخدم examID من الشاشة
                      answers: answers,
                      totalScore: (state.response.data?.total),
                      correctAnswers: "${state.response.data?.correct ?? 0}",
                      incorrectAnswers: " ${state.response.data?.wrong ?? 0}",
                      timeTaken: "${time}",
                    );

                    // ✅ تخزين النتيجة في `SharedPreferences`
                    ExamResultsStorage.addOrUpdateResult(examResult);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularPercentIndicator(
                          radius: 80,
                          lineWidth: 6,
                          center: Text(
                            "${state.response.data?.total.toString().substring(0, 5) ?? "0.00"}%",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          progressColor: ColorManager.primaryColor,
                          backgroundColor: ColorManager.failureColor,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ScoreResltWidet(
                              title: StringManager.correct,
                              reslt: (state.response.data?.correct ?? 0)
                                  .toStringAsFixed(0),
                              color: ColorManager.primaryColor,
                            ),
                            SizedBox(height: 10.h),
                            ScoreResltWidet(
                              title: StringManager.inCorrect,
                              reslt: (state.response.data?.wrong ?? 0)
                                  .toStringAsFixed(0),
                              color: ColorManager.failureColor,
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text("حدث خطأ أثناء تحميل النتائج"),
                    );
                  }
                },
              ),

              SizedBox(height: 80.h),
              CustomTextButton(
                onPressed: () async{
                  List<ExamResultModel> results = await ExamResultsStorage.getResults();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnswerScreen(
                        questions: results.last.questions ?? [],
                        answersList: results.last.answers??[],
                      ),
                    ),
                  );
                },
                text: StringManager.showResults,
                color: ColorManager.primaryColor,
                textColor: ColorManager.backgroundOTP,
              ),
              SizedBox(height: 24.h),
              CustomTextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizScreen(examID, exam)));
                },
                text: StringManager.startAgain,
                color: Colors.white,
                textColor: ColorManager.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
