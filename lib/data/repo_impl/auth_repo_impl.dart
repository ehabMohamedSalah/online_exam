import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/datasource_contract/auth_datasource.dart';
import 'package:online_exam/domain/entity/Auth/auth_response/auth_response.dart';
import 'package:online_exam/domain/entity/Auth/foreget_pass_entity/ForgetPassEntity.dart';
import 'package:online_exam/domain/entity/Auth/reset_pass_response_entity/reset_passowrd_response_entity.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';

import '../../domain/repo_contract/auth_repo.dart';
 

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo{
  @factoryMethod
  AuthDatasource apiDatasource;
  AuthRepoImpl(this.apiDatasource);


  @override
  Future<Either<AuthResponseEntity, String>> Login({required String email, required String password}) async{
    var response=await apiDatasource.Login(email: email, password: password);
    return response.fold(
            (response) {
              AuthResponseEntity loginResponseEntity=response.toLoginResponseEntity();
              return left(loginResponseEntity);
            },
            (err) => right(err),

    );

  }

  @override
  Future<Either<AuthResponseEntity, String>> SignUp({required String username, required String firstName, required String lastName, required String email, required String password, required String rePassword, required String phone})async {
    var response=await apiDatasource.SignUp(
        username:  username, firstName: firstName, lastName: lastName, email:  email, password:  password, rePassword:  rePassword, phone:  phone
    );
    return response.fold(
          (response) {
        AuthResponseEntity signupResponseEntity=response.toLoginResponseEntity();
        return left(signupResponseEntity);
      },
          (err) => right(err),

    );
  }

  @override
  Future<ApiResult<ForgetPasswordEntity>> ForgetPassword({required String email}) async{
    var response=await apiDatasource.ForgetPassword(email: email);
    return response;
  }

  @override
  Future<ApiResult<VerifyResponseEntity>> Verification({required String resetCode}) async{
    var response=await apiDatasource.Verification(resetCode: resetCode);
    return response;
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> ResetPassword({required String email, required String NewPassword})async {
    var response=await apiDatasource.ResetPassword(email: email, NewPassword: NewPassword);
    return response;
  }


 }