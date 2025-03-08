
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/api/endpoints.dart';

import '../../core/utils/string_manager.dart';
import '../datasource_contract/question_onexam_datasource.dart';
import '../model/question_on_exam/QuestionOnExamResponse.dart';

@Injectable(as: QuestionOnExamDatasource)
class QuestionOnExamDatasourceImpl extends QuestionOnExamDatasource{
  ApiManager apiManager;
  QuestionOnExamDatasourceImpl(this.apiManager);
  @override
  Future<ApiResult<QuestionOnExamResponse>> getQuestion({required String ExamId})async {

   try{
     var response= await apiManager.getRequest(
       Endpoint: EndPoint.QuestionsEndpoint(ExamId),
       headers: {
         "token": StringManager.token,
       },
     );
     QuestionOnExamResponse questions=QuestionOnExamResponse.fromJson(response.data);

     if(questions.code!=null){
       return ErrorApiResult(Exception(questions.message??"Un Know Exception occured"));
     }
     return SuccessApiResult(questions);
   }on DioException catch (e) {
     return ErrorApiResult(e);
   } catch (e) {
     return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
   }
  }

}