import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';

abstract class QuestionDatasource{
  Future<ApiResult<CheckQuestionResponseEntity>> postCheckQuestion({required num correct, required num wrong,required String total });
}