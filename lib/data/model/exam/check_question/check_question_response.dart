import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';

import 'wrong_questions.dart';
import 'correct_questions.dart';

/// message : "success"
/// correct : 4
/// wrong : 3
/// total : "57.14285714285714%"
/// WrongQuestions : [{"QID":"6700829e0a5849a4aee16297","Question":"Who is making the Web standards?","inCorrectAnswer":"A2","correctAnswer":"A4","answers":{}},{"QID":"6700829e0a5849a4aee16297","Question":"Who is making the Web standards?","inCorrectAnswer":"A2","correctAnswer":"A4","answers":{}},{"QID":"6700829e0a5849a4aee16297","Question":"Who is making the Web standards?","inCorrectAnswer":"A2","correctAnswer":"A4","answers":{}}]
/// correctQuestions : [{"QID":"670082800a5849a4aee16294","Question":"What does HTML stand for?","correctAnswer":"A2","answers":{}},{"QID":"670082800a5849a4aee16294","Question":"What does HTML stand for?","correctAnswer":"A2","answers":{}},{"QID":"670082800a5849a4aee16294","Question":"What does HTML stand for?","correctAnswer":"A2","answers":{}},{"QID":"670082800a5849a4aee16294","Question":"What does HTML stand for?","correctAnswer":"A2","answers":{}}]

class CheckQuestionResponse {
  String? message;
  num? correct;
  num? wrong;
  String? total;
  List<WrongQuestions>? wrongQuestions;
  List<CorrectQuestions>? correctQuestions;

  CheckQuestionResponse(
      {this.message,
      this.correct,
      this.wrong,
      this.total,
      this.wrongQuestions,
      this.correctQuestions});

  CheckQuestionResponse.fromJson(dynamic json) {
    message = json['message'];
    correct = json['correct'];
    wrong = json['wrong'];
    total = json['total'];
    if (json['WrongQuestions'] != null) {
      wrongQuestions = [];
      json['WrongQuestions'].forEach((v) {
        wrongQuestions?.add(WrongQuestions.fromJson(v));
      });
    }
    if (json['correctQuestions'] != null) {
      correctQuestions = [];
      json['correctQuestions'].forEach((v) {
        correctQuestions?.add(CorrectQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['correct'] = correct;
    map['wrong'] = wrong;
    map['total'] = total;
    if (wrongQuestions != null) {
      map['WrongQuestions'] = wrongQuestions?.map((v) => v.toJson()).toList();
    }
    if (correctQuestions != null) {
      map['correctQuestions'] =
          correctQuestions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CheckQuestionResponseEntity toCheckQuestionResponseEntity() {
    return CheckQuestionResponseEntity(
      message: message,
      correct: correct,
      wrong: wrong,
      total: total,
      wrongQuestions:
          wrongQuestions?.map((e) => e.toWrongQuestionsEntity()).toList(),
      correctQuestions:
          correctQuestions?.map((e) => e.toCorrectQuestionsEntity()).toList(),
    );
  }
}
