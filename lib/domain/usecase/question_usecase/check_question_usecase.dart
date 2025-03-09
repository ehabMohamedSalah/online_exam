import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';
import 'package:online_exam/domain/repo_contract/question_repo.dart';

@injectable
class CheckQuestionUsecase {
  QuestionRepo questionRepo;

  CheckQuestionUsecase(this.questionRepo);

  Future<ApiResult<CheckQuestionResponseEntity>> call({
    required List<Map<String, String>> answers,
    required int time,
  }) {
    return questionRepo.postCheckQuestion(answers: answers, time: time);
  }
}
