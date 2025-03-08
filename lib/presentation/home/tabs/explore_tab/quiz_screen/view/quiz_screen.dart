import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/presentation/home/tabs/explore_tab/quiz_screen/view/widget/button/quiz_button.dart';
import 'package:online_exam/presentation/home/tabs/explore_tab/quiz_screen/view/widget/button/timeout_func.dart';
import 'package:online_exam/presentation/home/tabs/explore_tab/quiz_screen/view/widget/helper_func/format_func.dart';
import 'package:online_exam/presentation/home/tabs/explore_tab/quiz_screen/view_model/question0nexam_cubit.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../exam/score_screen/view/exam_score_screen.dart';

class QuizScreen extends StatefulWidget {
  final String examID;
  const QuizScreen(this.examID, {Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int totalSeconds = 0;
  Timer? timer;
  List<List<int>> selectedAnswers = [];

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (totalSeconds > 0) {
        setState(() {
          totalSeconds--;
        });
      } else {
        t.cancel();
        DialogHelper.showFinishDialog(context);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<Question0nexamCubit>()..getQuestion(examID: widget.examID),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: BlocBuilder<Question0nexamCubit, Question0nexamState>(
            builder: (context, state) {
              if (state is QuestionOnExamLoadingState ||
                  state is Question0nexamInitial) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is QuestionOnExamErrorState) {
                return Center(child: Text(state.errMessage));
              }

              if (state is QuestionOnExamSuccessState) {
                var questions = state.response.data?.questions ?? [];

                if (questions.isEmpty) {
                  return const Center(child: Text("No questions available"));
                }

                /// ✅ تأمين قيمة `duration` لتجنب `setState` بعد `dispose`
                if (questions.isNotEmpty &&
                    totalSeconds == 0 &&
                    timer == null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      setState(() {
                        totalSeconds =
                            (questions.first.exam?.duration ?? 0) * 60;
                      });
                      startTimer();
                    }
                  });
                }

                if (selectedAnswers.isEmpty) {
                  selectedAnswers =
                      List.generate(questions.length, (index) => []);
                }

                var question = questions[currentIndex];
                bool isMultiple = question.type == "multiple_choice";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          const Icon(Icons.arrow_back_ios_new,
                              color: Colors.black, size: 25),
                          Text("Exam",
                              style: Theme.of(context).textTheme.labelLarge),
                        ]),
                        Row(children: [
                          const SizedBox(
                              height: 40, width: 40, child: Icon(Icons.timer)),
                          Text(
                            formatTime(totalSeconds),
                            style: TextStyle(
                                color: totalSeconds < 900
                                    ? Colors.red
                                    : Colors.green),
                          ),
                        ]),
                      ],
                    ),
                    Text("Question ${currentIndex + 1} of ${questions.length}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    LinearProgressIndicator(
                      value: (currentIndex + 1) / questions.length,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                      minHeight: 8,
                    ),
                    const SizedBox(height: 20),
                    Text(question.question ?? "No Question",
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 20),
                    Column(
                      children:
                          List.generate(question.answers?.length ?? 0, (index) {
                        String option =
                            question.answers?[index].answer as String? ?? "";

                        return isMultiple
                            ? CheckboxListTile(
                                title: Text(option),
                                value: selectedAnswers[currentIndex]
                                    .contains(index),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      selectedAnswers[currentIndex].add(index);
                                    } else {
                                      selectedAnswers[currentIndex]
                                          .remove(index);
                                    }
                                  });
                                },
                              )
                            : RadioListTile<int>(
                                title: Text(option),
                                value: index,
                                groupValue:
                                    selectedAnswers[currentIndex].isEmpty
                                        ? -1
                                        : selectedAnswers[currentIndex].first,
                                // ✅ تأمين قيمة `groupValue`
                                onChanged: (value) {
                                  setState(() {
                                    selectedAnswers[currentIndex] = [value!];
                                  });
                                },
                              );
                      }),
                    ),
                    SizedBox(height: 20.h),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        QuizButton(
                          ontap: currentIndex > 0
                              ? () => setState(() => currentIndex--)
                              : null,
                          text: const Text("Back",
                              style: TextStyle(color: Colors.blue)),
                          backgroundcolor: Colors.white,
                        ),
                        QuizButton(
                          ontap: currentIndex == questions.length - 1
                              ? () {
                                  // تجهيز قائمة تحتوي على جميع الإجابات لكل الأسئلة كـ List<Map<String, dynamic>>
                                  List<Map<String, dynamic>> answersList = [];

                                  for (int i = 0; i < questions.length; i++) {
                                    if (selectedAnswers[i].isNotEmpty) {
                                      // إضافة بيانات السؤال إلى القائمة كـ Map
                                      answersList.add({
                                        "questionId":
                                            questions[i].id, // ✅ رقم السؤال
                                        "correct": selectedAnswers[i]
                                            .map((index) => questions[i]
                                                .answers?[index]
                                                .key)
                                            .toList(), // ✅ جميع الأجوبة المختارة لهذا السؤال
                                      });

                                    }
                                  }
                                  print(answersList);
                                  Map<String, dynamic> quizData = {
                                    "answers": answersList, // ✅ قائمة تحتوي على جميع الإجابات كـ List<Map<String, dynamic>>
                                    "time": (questions.first.exam?.duration ?? 0) * 60 - totalSeconds,
                                  };

                                  print(
                                      "✅ Sending quizData: $quizData"); // ✅ اختبار صحة البيانات قبل الإرسال

                                  // الانتقال مع تمرير البيانات
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExamScoreScreen(
                                        quizData:
                                            quizData, // ✅ تمرير البيانات إلى الشاشة التالية
                                      ),
                                    ),
                                  );
                                }
                              : () => setState(() => currentIndex++),
                          text: Text(
                            currentIndex == questions.length - 1
                                ? "Submit"
                                : "Next",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          backgroundcolor: ColorManager.primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void submitQuiz() {
    print("Quiz submitted successfully!");
  }

  void printQuestionsTesttt(String question) {
    print(question);
  }
}
