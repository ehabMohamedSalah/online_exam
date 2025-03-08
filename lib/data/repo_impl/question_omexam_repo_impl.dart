
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/datasource_contract/question_onexam_datasource.dart';

import '../../domain/repo_contract/question_onexam_repo.dart';
import '../model/question_on_exam/QuestionOnExamResponse.dart';

@Injectable(as: QuestionOnexamRepo)
class QuestionOnexamRepoImpl extends QuestionOnexamRepo{
  QuestionOnExamDatasource apiDatasource;
  QuestionOnexamRepoImpl(this.apiDatasource);

  @override
  Future<ApiResult<QuestionOnExamResponse>> getQuestion({required String examID}) async{
     return apiDatasource.getQuestion(ExamId: examID);
  }



}