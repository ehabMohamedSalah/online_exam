import 'package:online_exam/domain/entity/exam/check_question/correct_question_entity.dart';

/// QID : "6700829e0a5849a4aee16297"
/// Question : "Who is making the Web standards?"
/// correctAnswer : "A4"
/// answers : {}

class CorrectQuestions {
  String? qid;
  String? question;
  String? correctAnswer;
  Map<String, dynamic>? answers;

  CorrectQuestions({this.qid, this.question, this.correctAnswer, this.answers});

  CorrectQuestions.fromJson(Map<String, dynamic> json) {
    qid = json['QID'];
    question = json['Question'];
    correctAnswer = json['correctAnswer'];
    answers = json['answers'] != null
        ? Map<String, dynamic>.from(json['answers'])
        : {};
  }

  Map<String, dynamic> toJson() {
    return {
      'QID': qid,
      'Question': question,
      'correctAnswer': correctAnswer,
      'answers': answers ?? {},
    };
  }

  CorrectQuestionsEntity toCorrectQuestionsEntity() {
    return CorrectQuestionsEntity(
      qid: qid,
      question: question,
      correctAnswer: correctAnswer,
      answers: answers,
    );
  }
}
