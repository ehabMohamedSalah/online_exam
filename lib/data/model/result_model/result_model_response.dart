import 'package:online_exam/data/model/get_all_exam_onsubject_response/Exams.dart';

import '../question_on_exam/Exam.dart';
import '../question_on_exam/Questions.dart';

class ExamResultModel {
  final String? examID;
  final List<Map<String, String>>? answers;
  final String? timeTaken;
  final String? totalScore;
  final String? correctAnswers;
  final String? incorrectAnswers;
  final Exams? exam;
  final List<Questions>? questions;

  ExamResultModel({
    this.examID,
    this.answers,
    this.timeTaken,
    this.totalScore,
    this.correctAnswers,
    this.incorrectAnswers,
    this.exam,
    this.questions,
  });

  // تحويل الكائن إلى JSON عند الإرسال إلى السيرفر
  Map<String, dynamic> toJson() {
    return {
      "examID": examID,
      "answers": answers ?? [],
      "timeTaken": timeTaken ?? "0",
      "totalScore": totalScore ?? "0.0",
      "correctAnswers": correctAnswers ?? "0",
      "incorrectAnswers": incorrectAnswers ?? "0",
      "exam": exam?.toJson(),
      "questions": questions?.map((q) => q.toJson()).toList(),
    };
  }

  // تحويل البيانات القادمة من السيرفر إلى Model
  factory ExamResultModel.fromJson(Map<String, dynamic> json) {
    return ExamResultModel(
      examID: json["examID"] as String?,
      answers: (json["answers"] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      timeTaken: json["timeTaken"]?.toString(),
      totalScore: json["totalScore"]?.toString(),
      correctAnswers: json["correctAnswers"]?.toString(),
      incorrectAnswers: json["incorrectAnswers"]?.toString(),
      exam: json["exam"] != null ? Exams.fromJson(json["exam"]) : null,
      questions: (json["questions"] as List<dynamic>?)
          ?.map((q) => Questions.fromJson(q))
          .toList(),
    );
  }
}
