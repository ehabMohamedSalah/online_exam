import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';
import 'package:online_exam/domain/repo_contract/profile_repo.dart';

@injectable
class ChangePasswordUsecase {
  @factoryMethod
  ProfileRepo changePassword;

  ChangePasswordUsecase(this.changePassword);

  Future<ApiResult<ChangePassowrdResponseEntity>> call(
      {required String token, required String message}) {
    return changePassword.ChangePassword(token: token, message: message);
  }
}
