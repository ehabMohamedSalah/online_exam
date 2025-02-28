import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/user_profile_entity.dart';

abstract class ProfileDatasource {
  Future<ApiResult<UserProfileEntity>> getProfileInfo({required String id});

  Future<ApiResult<UserProfileEntity>> putEditProfile(
      {required String id,
      required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String phone});

  Future<ApiResult<ChangePassowrdResponseEntity>> ChangePassword(
      {required String token, required String message});
}
