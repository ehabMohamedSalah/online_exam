
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/data/datasource_contract/login_datasource.dart';
import 'package:online_exam/data/model/Auth/LoginResponse.dart';

import '../../core/api/api_result.dart';

@Injectable(as:LoginDatasource )
class LoginDatasourceImpl extends LoginDatasource{
  @factoryMethod
  ApiManager apiManager;
  LoginDatasourceImpl(this.apiManager);
  
  @override
  Future<ApiResult<LoginResponse>> Login({required String email, required String password})async {
    try{
      var response=await apiManager.postRequest(
          endpoint: EndPoint.signInEndpoint, body:  {
        "email":email,
        "password":password
      }      );
      LoginResponse loginResponse =LoginResponse.fromJson(response.data) ;
         return SuccessApiResult(loginResponse);
    } on DioException catch (e) {
      return ErrorApiResult(e);
    }





  }
  
}