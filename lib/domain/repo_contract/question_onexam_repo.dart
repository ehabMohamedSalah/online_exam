
import '../../core/api/api_result.dart';
import '../../data/model/question_on_exam/QuestionOnExamResponse.dart';

abstract class QuestionOnexamRepo{
  Future<ApiResult<QuestionOnExamResponse>> getQuestion({required String examID});
}