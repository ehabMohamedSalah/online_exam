
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data/model/Auth/forget_passowrd/forget_password_response.dart';
import '../../entity/Auth/foreget_pass_entity/forget_pass_entity.dart';
import '../../repo_contract/auth_repo.dart';

@injectable
class ForgetPasswordUsecase{
  @factoryMethod
  AuthRepo forgetPassword;
  ForgetPasswordUsecase(this.forgetPassword);
  Future<ApiResult<ForgetPasswordEntity>>call({required String email}){
   return forgetPassword.ForgetPassword(email: email);
  }


}