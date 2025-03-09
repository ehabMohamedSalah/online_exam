import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';

abstract class QuestionRepo {
  Future<ApiResult<CheckQuestionResponseEntity>> postCheckQuestion({
    required List<Map<String, String>> answers,
    required int time,
  });
}
