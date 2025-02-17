
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/data/datasource_contract/auth_datasource.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';
import 'package:online_exam/data/model/Auth/forget_passowrd/ForgetPasswordResponse.dart';
import 'package:online_exam/domain/entity/Auth/foreget_pass_entity/ForgetPassEntity.dart';

@Injectable(as:AuthDatasource )
class AuthDatasourceImpl extends AuthDatasource{
  @factoryMethod
  ApiManager apiManager;
  AuthDatasourceImpl(this.apiManager);
  
  @override
  Future<Either<AuthResponseModel, String>> Login({required String email, required String password})async {
    try{
      var response=await apiManager.postRequest(
          endpoint: EndPoint.signInEndpoint, body:  {
        "email":email,
        "password":password
      }      );
      AuthResponseModel loginResponse =AuthResponseModel.fromJson(response.data) ;
      if(loginResponse.code!=null)return right(loginResponse.message??"");
      return left(loginResponse);
    }catch(err){
      return right(err.toString());
    }





  }

  @override
  Future<Either<AuthResponseModel, String>> SignUp({required String username, required String firstName, required String lastName, required String email, required String password, required String rePassword, required String phone})async {
    try{
      var response=await apiManager.postRequest(
          endpoint: EndPoint.signUpEndpoint, body:  {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      }      );
      AuthResponseModel signUpResponse =AuthResponseModel.fromJson(response.data) ;
      if(signUpResponse.code!=null)return right(signUpResponse.message??"");
      return left(signUpResponse);
    }catch(err){
      return right(err.toString());
    }
  
}

  @override
    Future<ApiResult<ForgetPasswordEntity>> ForgetPassword({required String email}) async{
    try{
      var response=await apiManager.postRequest(
          endpoint: EndPoint.ForgetPasswordEndpoints, body:  {
        "email":email,
      }      );
      ForgetPasswordResponse forgetResponse =ForgetPasswordResponse.fromJson(response.data) ;
      ForgetPasswordEntity forgetPasswordEntity=forgetResponse.toForgetPasswordEntity();
      return SuccessApiResult(forgetPasswordEntity);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    }



  }}