import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/question_on_exam/Questions.dart';

class AnswerCard extends StatelessWidget {
  final Questions question;
  final String correctAnswer;
  final String userAnswer;

  const AnswerCard({
    Key? key,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  }) : super(key: key);

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
            Column(
              children: question.answers!.map((answer) {
                bool isSelected = userAnswer == answer.key;
                bool isCorrect = answer.key == correctAnswer;
                Color answerColor = isCorrect
                    ? Colors.green
                    : (isSelected ? Colors.red : Colors.black);

                return ListTile(
                  title: Text(
                    answer.answer ?? "",
                    style: TextStyle(
                      color: answerColor,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  leading: Icon(
                    isCorrect ? Icons.check_circle : (isSelected ? Icons.cancel : Icons.radio_button_unchecked),
                    color: answerColor,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
