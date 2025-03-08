import 'package:online_exam/data/model/exam/check_question/correct_questions.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';

/// message : "success"
/// correct : 2
/// wrong : 0
/// total : "100%"
/// WrongQuestions : []
/// correctQuestions : [{"QID":"6700829e0a5849a4aee16297","Question":"Who is making the Web standards?","correctAnswer":"A4","answers":{}},{"QID":"670082800a5849a4aee16294","Question":"What does HTML stand for?","correctAnswer":"A2","answers":{}}]

class CheckQuestionResponse {
  String? message;
  num? correct;
  num? wrong;
  String? total;
  List<dynamic>? wrongQuestions;
  List<CorrectQuestions>? correctQuestions;

  CheckQuestionResponse({
    this.correctQuestions,
    this.total,
    this.wrong,
    this.message,
    this.correct,
    this.wrongQuestions,
  });

  CheckQuestionResponse.fromJson(dynamic json) {
    message = json['message'];
    correct = json['correct'];
    wrong = json['wrong'];
    total = json['total'];
    wrongQuestions = json['WrongQuestions'] ?? []; // Handles null case

    if (json['correctQuestions'] != null) {
      correctQuestions = (json['correctQuestions'] as List)
          .map((v) => CorrectQuestions.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'correct': correct,
      'wrong': wrong,
      'total': total,
      'WrongQuestions': wrongQuestions ?? [],
      'correctQuestions':
          correctQuestions?.map((v) => v.toJson()).toList() ?? [],
    };
  }

  CheckQuestionResponseEntity toCheckQuestionResponseEntity() {
    return CheckQuestionResponseEntity(
      message: message,
      correct: correct,
      wrong: wrong,
      total: total,
      wrongQuestions: wrongQuestions ?? [],
      correctQuestions:
          correctQuestions?.map((e) => e.toCorrectQuestionsEntity()).toList(),
    );
  }
}
