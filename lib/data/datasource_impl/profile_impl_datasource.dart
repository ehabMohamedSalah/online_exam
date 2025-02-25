import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/data/datasource_contract/profile_datasource.dart';
import 'package:online_exam/data/model/profile_tab/change_password/change_password_response.dart';
import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';

@Injectable(as: ProfileDatasource)
class ProfileDatasourceImpl extends ProfileDatasource {
  @factoryMethod
  ApiManager apiManager;

  ProfileDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<ChangePassowrdResponseEntity>> ChangePassword(
      {required String token, required String message}) async {
    try {
      var response = await apiManager.patchRequest(
          endpoint: EndPoint.changePasswordEndpoint);

      ChangePasswordResponse changePasswordResponseModel =
          ChangePasswordResponse.fromJson(response.data);
      ChangePassowrdResponseEntity changePasswordResponseEntity =
          changePasswordResponseModel.toChangePasswordResponseEntity();

      // Ensure proper error handling
      if (changePasswordResponseEntity.message != null) {
        return ErrorApiResult(Exception(
            changePasswordResponseEntity.message ?? "Unknown error occurred"));
      }

      return SuccessApiResult(changePasswordResponseEntity);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
    }
  }
}
