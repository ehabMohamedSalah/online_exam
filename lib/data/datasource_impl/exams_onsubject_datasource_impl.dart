
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/model/get_all_exam_onsubject_response/GetAllExamsOnSubjectResponse.dart';
import 'package:online_exam/domain/entity/get_all_exam_on_Subject_entity_response/get_all_exam_obSubject_entity.dart';

import '../../core/api/endpoints.dart';
import '../../core/utils/string_manager.dart';
import '../datasource_contract/exams_onsubject_datasource.dart';

@Injectable(as: ExamsOnSubjectsDatasource)
class ExamsOnSubjectsDatasourceImpl extends ExamsOnSubjectsDatasource{
  ApiManager apiManager;
  ExamsOnSubjectsDatasourceImpl(this.apiManager);
  @override
  Future<ApiResult<GetAllExamsOnSubjectResponse>> GetExamsOnSubjects({required String subjectID}) async{
    try {
      var response = await apiManager.getRequest(
        Endpoint: EndPoint.ExamsOnSubjectEndpoint(subjectID),
        headers: {
          "token": StringManager.token,
        },
      );

      GetAllExamsOnSubjectResponse allExamModel = GetAllExamsOnSubjectResponse.fromJson(response.data);
      GetAllExamsOnSubjectResponse AllExamsEntity = allExamModel;


      // Ensure proper error handling
      if (AllExamsEntity.code != null) {
        return ErrorApiResult(Exception(
            AllExamsEntity.message ?? "Unknown error occurred"));
      }

      return SuccessApiResult(AllExamsEntity);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
    }
  }
  }
  

