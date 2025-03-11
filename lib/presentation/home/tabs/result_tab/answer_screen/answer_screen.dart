import 'package:flutter/material.dart';
import '../../../../../data/model/question_on_exam/Questions.dart';
import '../widget/answer_card.dart';

class AnswerScreen extends StatelessWidget {
  final List<Questions> questions;
  final List<Map<String, String>> answersList;

  const AnswerScreen({Key? key, required this.questions, required this.answersList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Answers")),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final String correctAnswer = questions[index].correct ?? "";
          final  String userAnswer = _getUserAnswer(answersList, question.id!);

          return AnswerCard(
            question: question,
            correctAnswer: correctAnswer,
            userAnswer: userAnswer,
          );
        },
      ),
    );
  }

  String _getCorrectAnswer(List<Map<String, String>> answersList, String questionId) {
    for (var map in answersList) {
      if (map.containsKey("questionId") && map["questionId"] == questionId) {
        return map["correct"] ?? "";
      }
    }
    return "";
  }

  String _getUserAnswer(List<Map<String, String>> answersList, String questionId) {
    for (var map in answersList) {
      if (map.containsKey("questionId") && map["questionId"] == questionId) {
        return map["correct"] ?? ""; // ✅ استخراج إجابة المستخدم من correct
      }
    }
    return "";
  }
}


