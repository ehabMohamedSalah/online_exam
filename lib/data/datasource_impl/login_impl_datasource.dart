
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/data/datasource_contract/login_datasource.dart';
import 'package:online_exam/data/model/Auth/login/LoginResponse.dart';

@Injectable(as:LoginDatasource )
class LoginDatasourceImpl extends LoginDatasource{
  @factoryMethod
  ApiManager apiManager;
  LoginDatasourceImpl(this.apiManager);
  
  @override
  Future<Either<LoginResponse, String>> Login({required String email, required String password})async {
    try{
      var response=await apiManager.postRequest(
          endpoint: EndPoint.signInEndpoint, body:  {
        "email":email,
        "password":password
      }      );
      LoginResponse loginResponse =LoginResponse.fromJson(response.data) ;
      if(loginResponse.code!=null)return right(loginResponse.message??"");
      return left(loginResponse);
    }catch(err){
      return right(err.toString());
    }





  }
  
}