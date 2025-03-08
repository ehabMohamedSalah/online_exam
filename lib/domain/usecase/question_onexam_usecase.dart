
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
 import '../../data/model/question_on_exam/QuestionOnExamResponse.dart';
import '../repo_contract/question_onexam_repo.dart';

@injectable
class QuestionOnexamUsecase{
  QuestionOnexamRepo questionOnexamRepo;
  QuestionOnexamUsecase(this.questionOnexamRepo);
  Future<ApiResult<QuestionOnExamResponse>> call({required String examID}){
    return questionOnexamRepo.getQuestion(examID: examID);
  }
}