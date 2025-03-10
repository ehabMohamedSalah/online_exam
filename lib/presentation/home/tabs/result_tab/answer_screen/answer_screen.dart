import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/question_on_exam/Questions.dart';

class QuestionCubit extends Cubit<Map<String, String?>> {
  QuestionCubit() : super({});

  void checkAnswer(String questionId, String selectedAnswer) {
    emit({...state, questionId: selectedAnswer});
  }
}

class AnswerScreen extends StatelessWidget {
  final List<Questions> questions;
  final List<Map<String, String>> answersList;

  const AnswerScreen({Key? key, required this.questions, required this.answersList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("اختبار")),
        body: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            final correctAnswer = _getCorrectAnswer(answersList, question.id!);

            return QuestionItem(
              question: question,
              correctAnswer: correctAnswer,
            );
          },
        ),
      ),
    );
  }

  String _getCorrectAnswer(List<Map<String, String>> answersList, String questionId) {
    for (var map in answersList) {
      if (map.containsKey(questionId)) {
        return map[questionId] ?? "";
      }
    }
    return "";
  }
}

class QuestionItem extends StatelessWidget {
  final Questions question;
  final String correctAnswer;

  const QuestionItem({Key? key, required this.question, required this.correctAnswer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question ?? "",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            BlocBuilder<QuestionCubit, Map<String, String?>>(
              builder: (context, state) {
                String? selectedAnswer = state[question.id];

                return Column(
                  children: question.answers!.map((answer) {
                    bool isSelected = selectedAnswer == answer.key;
                    bool isCorrect = answer.key == correctAnswer;
                    bool isWrongSelected = isSelected && !isCorrect;

                    return RadioListTile<String>(
                      title: Text(
                        answer.answer ?? "",
                        style: TextStyle(
                          color: isCorrect
                              ? Colors.green
                              : isWrongSelected
                              ? Colors.red
                              : Colors.black,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      value: answer.key ?? "",
                      groupValue: selectedAnswer,
                      onChanged: (value) {
                        if (selectedAnswer == null) {
                          context.read<QuestionCubit>().checkAnswer(question.id!, value!);
                        }
                      },
                      activeColor: isCorrect ? Colors.green : Colors.red,
                      tileColor: isSelected
                          ? (isCorrect ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2))
                          : null,
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
