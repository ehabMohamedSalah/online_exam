import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/datasource_contract/profile_datasource.dart';
import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/user_profile_entity.dart';
import 'package:online_exam/domain/repo_contract/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl extends ProfileRepo {
  final ProfileDatasource apiDatasource;

  ProfileRepoImpl(this.apiDatasource);

  Future<ApiResult<UserProfileEntity>> getProfileInfo({required String id}) {
    return apiDatasource.getProfileInfo(id: id);
  }

  @override
  Future<ApiResult<UserProfileEntity>> putEditProfile(
      {required String id,
      required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String phone}) async {
    var response = await apiDatasource.putEditProfile(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone);
    return response;
  }

  @override
  Future<ApiResult<ChangePassowrdResponseEntity>> ChangePassword({
    required String token,
    required String message,
  }) async {
    return await apiDatasource.ChangePassword(token: token, message: message);
  }
}
