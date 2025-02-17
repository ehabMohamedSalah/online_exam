import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/datasource_contract/auth_datasource.dart';
import 'package:online_exam/data/model/Auth/change_password/change_pass_response.dart';
import 'package:online_exam/data/model/Auth/verify_code/verify_response.dart';
import 'package:online_exam/domain/entity/Auth/auth_response.dart';
import 'package:online_exam/domain/entity/Auth/change_pass_response_entity.dart';
import 'package:online_exam/domain/entity/Auth/forget_password_response_entity.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity.dart';

import '../../domain/repo_contract/auth_repo.dart';

@Injectable(as: AuthRepo)
class LoginRepoImpl extends AuthRepo {
  @factoryMethod
  AuthDatasource apiDatasource;

  LoginRepoImpl(this.apiDatasource);

  @override
  Future<Either<AuthResponseEntity, String>> Login(
      {required String email, required String password}) async {
    var response = await apiDatasource.Login(email: email, password: password);
    return response.fold(
      (response) {
        AuthResponseEntity loginResponseEntity =
            response.toLoginResponseEntity();
        return left(loginResponseEntity);
      },
      (err) => right(err),
    );
  }

  @override
  Future<Either<AuthResponseEntity, String>> SignUp(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    var response = await apiDatasource.SignUp(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    return response.fold(
      (response) {
        AuthResponseEntity signupResponseEntity =
            response.toLoginResponseEntity();
        return left(signupResponseEntity);
      },
      (err) => right(err),
    );
  }

  @override
  Future<Either<ChangePassResponseEntity, String>> ChangePass(
      {required String message, required String token}) async {
    var response =
        await apiDatasource.ChangePass(message: message, token: token);
    return response.fold(
      (response) {
        ChangePassResponseEntity changepassResponseEntity =
            response.toChangePassResponseEntity();
        return left(changepassResponseEntity);
      },
      (err) => right(err),
    );
  }

  Future<Either<ForgetPasswordResponseEntity, String>> ForgetPass(
      {required String message,
      required String info,
      required int code}) async {
    var response = await apiDatasource.ForgetPass(
        message: message, info: info, code: code);
    return response.fold(
      (response) {
        ForgetPasswordResponseEntity forgetpassResponseEntity =
            response.toForgetPasswordResponseEntity();
        return left(forgetpassResponseEntity);
      },
      (err) => right(err),
    );
  }

  Future<Either<VerifyResponseEntity, String>> VerifyCode(
      {required String status}) async {
    var response = await apiDatasource.VerifyCode(status: status);
    return response.fold(
      (response) {
        VerifyResponseEntity verifyResponseEntity =
            response.toVerifyResponseEntity();
        return left(verifyResponseEntity);
      },
      (err) => right(err),
    );
  }
}
