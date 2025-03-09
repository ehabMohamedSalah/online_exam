import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/datasource_contract/question_datasource.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';
import 'package:online_exam/domain/repo_contract/question_repo.dart';

@Injectable(as: QuestionRepo)
class QuestionRepoImpl extends QuestionRepo {
  final QuestionDatasource apiDatasource;

  QuestionRepoImpl(this.apiDatasource);

  @override
  Future<ApiResult<CheckQuestionResponseEntity>> postCheckQuestion({
  required List<Map<String, String>> answers,
  required int time,
}) {
    return apiDatasource.postCheckQuestion(answers: answers, time: time);
  }

}
