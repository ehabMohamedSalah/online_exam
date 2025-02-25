import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/datasource_contract/profile_datasource.dart';
import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';
import 'package:online_exam/domain/repo_contract/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl extends ProfileRepo {
  final ProfileDatasource apiDatasource;

  ProfileRepoImpl(this.apiDatasource);

  @override
  Future<ApiResult<ChangePassowrdResponseEntity>> ChangePassword({
    required String token,
    required String message,
  }) async {
    return await apiDatasource.ChangePassword(token: token, message: message);
  }
}
