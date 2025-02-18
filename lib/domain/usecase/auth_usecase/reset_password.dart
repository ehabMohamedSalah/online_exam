
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/repo_contract/auth_repo.dart';

import '../../../core/api/api_result.dart';
import '../../entity/Auth/reset_pass_response_entity/reset_passowrd_response_entity.dart';

@injectable
class ResetPasswordUsecase{
  @factoryMethod
  AuthRepo resetPassword;
  ResetPasswordUsecase(this.resetPassword);

  Future<ApiResult<ResetPasswordResponseEntity>> call({required String email, required String NewPassword}){
  return resetPassword.ResetPassword(email: email, NewPassword: NewPassword);
  }
}