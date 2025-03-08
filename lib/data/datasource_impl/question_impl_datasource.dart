import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/data/datasource_contract/question_datasource.dart';
import 'package:online_exam/data/model/exam/check_question/check_question_response.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';

@Injectable(as: QuestionDatasource)
class QuestionDatasourceImpl extends QuestionDatasource {
  final ApiManager apiManager;

  QuestionDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<CheckQuestionResponseEntity>> postCheckQuestion({
    required num correct,
    required num wrong,
    required String total,
  }) async {
    try {
      var response = await apiManager.postRequest(
        endpoint: EndPoint.checkQuestionEndpoint,
        headers: {
          "token": StringManager.token,
        },
        body: {
          "correct": correct,
          "wrong": wrong,
          "total": total,
        },
      );

      CheckQuestionResponse checkQuestionResponse = response.data != null
          ? CheckQuestionResponse.fromJson(response.data)
          : CheckQuestionResponse();
      CheckQuestionResponseEntity checkQuestionResponseEntity =
          checkQuestionResponse.toCheckQuestionResponseEntity();

      return SuccessApiResult(checkQuestionResponseEntity);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
    }
  }
}
