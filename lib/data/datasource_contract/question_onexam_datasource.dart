

import '../../core/api/api_result.dart';
import '../model/question_on_exam/QuestionOnExamResponse.dart';

abstract class QuestionOnExamDatasource{
  Future<ApiResult<QuestionOnExamResponse>> getQuestion({required String ExamId});
}