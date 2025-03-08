import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';
import 'package:online_exam/domain/repo_contract/question_repo.dart';

@injectable
class CheckQuestionUsecase {
  QuestionRepo questionRepo;

  CheckQuestionUsecase(this.questionRepo);

  Future<ApiResult<CheckQuestionResponseEntity>> call({
    required num correct,
    required num wrong,
    required String total,
  }) {
    return questionRepo.postCheckQuestion(
        correct: correct, wrong: wrong, total: total);
  }
}
