import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/core/local_storage/exam_result_storage.dart';
import 'package:online_exam/data/datasource_contract/auth_datasource.dart';
import 'package:online_exam/data/model/Auth/Logout_response.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';
import 'package:online_exam/data/model/Auth/forget_passowrd/forget_password_response.dart';
import 'package:online_exam/data/model/Auth/rese_pass/reset_password_response.dart';
import 'package:online_exam/data/model/Auth/verify_code/verify_response.dart';
import 'package:online_exam/domain/entity/Auth/foreget_pass_entity/forget_pass_entity.dart';
import 'package:online_exam/domain/entity/Auth/reset_pass_response_entity/reset_passowrd_response_entity.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';

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
  Future<ApiResult<LogoutResponse>> Logout() async {
    try {
      var userToken = await ExamResultsStorage.getUserToken();
      var response = await apiManager.getRequest(
        Endpoint: EndPoint.logoutEndpoint,
        headers: {
          "token": userToken,
        },
      );

      LogoutResponse logoutResponse = LogoutResponse.fromJson(response.data);
      if (logoutResponse.message != null) {
        return ErrorApiResult(Exception(
            logoutResponse.message ?? "Unknown error occurred"));
      }

      return SuccessApiResult(logoutResponse);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
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
  Future<ApiResult<ForgetPasswordEntity>> ForgetPassword(
      {required String email}) async {
    try {
      var response = await apiManager.postRequest(
        endpoint: EndPoint.ForgetPasswordEndpoints,
        body: {"email": email},
      );

      ForgetPasswordResponse forgetResponse =
          ForgetPasswordResponse.fromJson(response.data);
      ForgetPasswordEntity forgetPasswordEntity =
          forgetResponse.toForgetPasswordEntity();

      // Ensure proper error handling
      if (forgetPasswordEntity.code != null) {
        return ErrorApiResult(Exception(
            forgetPasswordEntity.message ?? "Unknown error occurred"));
      }

      return SuccessApiResult(forgetPasswordEntity);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<ApiResult<VerifyResponseEntity>> Verification(
      {required String resetCode}) async {
    try {
      var response = await apiManager.postRequest(
        endpoint: EndPoint.verifyEndpoint,
        body: {"resetCode": resetCode},
        headers: {
          "token": "aaa", // Replace YOUR_TOKEN_HERE with the actual token
        },
      );

      VerifyResponseModel verifyResponseModel =
          VerifyResponseModel.fromJson(response.data);
      VerifyResponseEntity verifyResponseEntity =
          verifyResponseModel.toVerifyResponseEntity();

      // Ensure proper error handling
      if (verifyResponseEntity.code != null) {
        return ErrorApiResult(Exception(
            verifyResponseEntity.message ?? "Unknown error occurred"));
      }

      return SuccessApiResult(verifyResponseEntity);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> ResetPassword(
      {required String email, required String NewPassword}) async {
    try {
      var response = await apiManager.put(
        Endpoint: EndPoint.resetPasswordEndpoint, // ✅ Use the PUT request
        headers: {
          "Content-Type": "application/json",
        },
        data: {
          // ✅ Pass the request body here
          "email": email,
          "newPassword": NewPassword
        },
      );

      ResetPasswordResponse resetPasswordResponseModel =
          ResetPasswordResponse.fromJson(response.data);
      ResetPasswordResponseEntity resetPasswordResponseEntity =
          resetPasswordResponseModel.toResetPasswordResponseEntity();

      // Ensure proper error handling
      if (resetPasswordResponseEntity.code != null) {
        return ErrorApiResult(Exception(
            resetPasswordResponseEntity.message ?? "Unknown error occurred"));
      }

      return SuccessApiResult(resetPasswordResponseEntity);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    } catch (e) {
      return ErrorApiResult(Exception("Unexpected error: ${e.toString()}"));
    }
  }
}
