import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/presentation/home/tabs/result_tab/widget/result_card.dart';

import '../../../../data/model/result_model/result_model_response.dart';
import '../../../../core/local_storage/exam_result_storage.dart';
import 'answer_screen/answer_screen.dart';

class ResultTabScreen extends StatelessWidget {
  const ResultTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Exams"),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<ExamResultModel>>(
        future: ExamResultsStorage.getResults(), // ✅ تحميل النتائج من التخزين
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // 🔄 عرض لودينج أثناء التحميل
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading results")); // ⚠️ في حالة حدوث خطأ
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No exam results available")); // ℹ️ لو مفيش نتائج
          }

          List<ExamResultModel> results = snapshot.data!; // ✅ جلب البيانات

          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                  child: ListView.separated(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return CustomResultCard(
                        time: results[index].timeTaken??"",
                        correctNumber: results[index].correctAnswers??"",
                        questionNumber: "${results[index].questions?.length ?? ""}",
                        quizTime: "${results[index].exam?.duration ?? ""}",
                        text: results[index].exam?.title??"", // ✅ عرض اسم الامتحان
                        image: "assets/images/Profit.png",
                        onTap: () {
                          if (results[index].questions != null && results[index].questions!.isNotEmpty) {
                          /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnswerScreen(

                                ),
                              ),
                            );*/
                          }
                        },

                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
