import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/data/datasource_contract/auth_datasource.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';
import 'package:online_exam/data/model/Auth/change_password/change_pass_response.dart';
import 'package:online_exam/data/model/Auth/forget_passowrd/forget_password_response.dart';
import 'package:online_exam/data/model/Auth/verify_code/verify_response.dart';

@Injectable(as: AuthDatasource)
class AuthDatasourceImpl extends AuthDatasource {
  @factoryMethod
  ApiManager apiManager;

  AuthDatasourceImpl(this.apiManager);

  @override
  Future<Either<AuthResponseModel, String>> Login(
      {required String email, required String password}) async {
    try {
      var response = await apiManager.postRequest(
          endpoint: EndPoint.signInEndpoint,
          body: {"email": email, "password": password});
      AuthResponseModel loginResponse =
          AuthResponseModel.fromJson(response.data);
      if (loginResponse.code != null) return right(loginResponse.message ?? "");
      return left(loginResponse);
    } catch (err) {
      return right(err.toString());
    }
  }

  @override
  Future<Either<AuthResponseModel, String>> SignUp(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    try {
      var response = await apiManager
          .postRequest(endpoint: EndPoint.signUpEndpoint, body: {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      });
      AuthResponseModel signUpResponse =
          AuthResponseModel.fromJson(response.data);
      if (signUpResponse.code != null)
        return right(signUpResponse.message ?? "");
      return left(signUpResponse);
    } catch (err) {
      return right(err.toString());
    }
  }

  @override
  Future<Either<ChangePassResponse, String>> ChangePass(
      {required String message, required String token}) async {
    try {
      var response = await apiManager
          .postRequest(endpoint: EndPoint.changePasswordEndpoint, body: {
        "message": message,
        "token": token,
      });
      ChangePassResponse changePassResponse =
          ChangePassResponse.fromJson(response.data);
      if (changePassResponse.message != null)
        return right(changePassResponse.token ?? "");
      return left(changePassResponse);
    } catch (err) {
      return right(err.toString());
    }
  }

  Future<Either<ForgetPasswordResponse, String>> ForgetPass({
    required String message,
    required String info,
    required int code,
  }) async {
    try {
      var response = await apiManager.postRequest(
        endpoint: EndPoint.forgetPasswordEndpoint,
        body: {"message": message, "info": info, 'code': code},
      );

      ForgetPasswordResponse forgetPassResponse =
          ForgetPasswordResponse.fromJson(response.data);

      if (forgetPassResponse.message != null) {
        return right(forgetPassResponse.code?.toString() ?? "");
      }

      return left(forgetPassResponse);
    } catch (err) {
      return right(err.toString());
    }
  }

  Future<Either<VerifyResponse, String>> VerifyCode(
      {required String status}) async {
    try {
      var response = await apiManager.postRequest(
        endpoint: EndPoint.verifyEndpoint,
        body: {"status": status},
      );

      VerifyResponse verifyCodeResponse =
          VerifyResponse.fromJson(response.data);

      if (verifyCodeResponse.status != null) {
        return right(verifyCodeResponse.status?.toString() ?? "");
      }

      return left(verifyCodeResponse);
    } catch (err) {
      return right(err.toString());
    }
  }
}
