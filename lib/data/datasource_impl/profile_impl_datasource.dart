import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/data/datasource_contract/profile_datasource.dart';
import 'package:online_exam/data/model/profile_tab/change_password/change_password_response.dart';
import 'package:online_exam/data/model/profile_tab/profile_response.dart';
import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/profile_response_entity.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/user_profile_entity.dart';

@Injectable(as: ProfileDatasource)
class ProfileDatasourceImpl extends ProfileDatasource {
  @factoryMethod
  ApiManager apiManager;

  ProfileDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<UserProfileEntity>> getProfileInfo(
      {required String id}) async {
    try {
      var response = await apiManager.getRequest(
        Endpoint: EndPoint.profileInfoEndpoint,
        headers: {
          "token": StringManager.token,
        },
      );

      ProfileResponse profileResponse = ProfileResponse.fromJson(response.data);
      ProfileResponseEntity userProfileEntity =
          profileResponse.toProfileResponseEntity();

      if (userProfileEntity.code != null) {
        return ErrorApiResult(
            Exception(userProfileEntity.message ?? "Unknown error occurred"));
      }

      if (userProfileEntity.user == null) {
        return ErrorApiResult(Exception("User data is null"));
      }

      return SuccessApiResult(userProfileEntity.user!);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<ApiResult<UserProfileEntity>> putEditProfile({
    required String id,
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    try {
      var response = await apiManager.put(
        Endpoint: EndPoint.editProfileEndpoint,
        headers: {
          "Content-Type": "application/json",
          "token":StringManager.token
        },
        data: {
          "username": username,
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phone": phone,
        },
      );
      ProfileResponse editProfile = ProfileResponse.fromJson(response.data);
      ProfileResponseEntity profileResponseEntity =
          editProfile.toProfileResponseEntity();

      if (profileResponseEntity.code != null) {
        return ErrorApiResult(Exception(
            profileResponseEntity.message ?? "Unknown error occurred"));
      }

      if (profileResponseEntity.user == null) {
        return ErrorApiResult(Exception("User data is null"));
      }

      return SuccessApiResult(profileResponseEntity.user!);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
    }
  }

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
