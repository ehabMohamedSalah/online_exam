import 'package:online_exam/domain/entity/exam/check_question/correct_question_entity.dart';
import 'package:online_exam/domain/entity/exam/check_question/wrong_question_entity.dart';

/// message : "success"
/// correct : 2
/// wrong : 0
/// total : "100%"
/// WrongQuestions : []
/// correctQuestions : [{"QID":"6700829e0a5849a4aee16297","Question":"Who is making the Web standards?","correctAnswer":"A4","answers":{}},{"QID":"670082800a5849a4aee16294","Question":"What does HTML stand for?","correctAnswer":"A2","answers":{}}]

class CheckQuestionResponseEntity {
  String? message;
  num? correct;
  num? wrong;
  String? total;
  List<WrongQuestionsEntity>? wrongQuestions;
  List<CorrectQuestionsEntity>? correctQuestions;

  CheckQuestionResponseEntity({
    this.correctQuestions,
    this.total,
    this.wrong,
    this.message,
    this.correct,
    this.wrongQuestions,
  });
}
