
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/data/datasource_contract/auth_datasource.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';
import 'package:online_exam/data/model/Auth/forget_passowrd/forget_password_response.dart';
import 'package:online_exam/data/model/Auth/rese_pass/reset_password_response.dart';
import 'package:online_exam/data/model/Auth/verify_code/verify_response.dart';
import 'package:online_exam/data/model/get-all-exams-model-response/get_alll_exam_response.dart';
import 'package:online_exam/domain/entity/Auth/foreget_pass_entity/forget_pass_entity.dart';
import 'package:online_exam/domain/entity/Auth/reset_pass_response_entity/reset_passowrd_response_entity.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';
import 'package:online_exam/domain/entity/get_all_exams_entity/get_all_exam_entity.dart';

import '../../core/utils/string_manager.dart';
import '../datasource_contract/subjects_datasource.dart';

@Injectable(as:SubjectDataSource )
class SubjectDataSourceImpl extends SubjectDataSource {
  @factoryMethod
  ApiManager apiManager;

  SubjectDataSourceImpl(this.apiManager);

  @override
  @override
  Future<ApiResult<GetAllExamResponseEntity>> GetAllSubject() async {
    try {
      var response = await apiManager.getRequest(
        Endpoint: EndPoint.getAllExams,
        headers: {
          "token": StringManager.token,
        },
      );

      GetAllExamResponse allExamModel = GetAllExamResponse.fromJson(
          response.data);
      GetAllExamResponseEntity AllExamsEntity = allExamModel
          .toGetAllExamEntity();

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





