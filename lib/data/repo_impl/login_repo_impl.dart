import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/datasource_contract/login_datasource.dart';
import 'package:online_exam/data/model/Auth/LoginResponse.dart';
import 'package:online_exam/domain/entity/Auth/login_response_entity/login_response.dart';
import 'package:online_exam/domain/repo_contract/login_repo.dart';

import '../../core/api/api_result.dart';


@Injectable(as: LoginRepo)
class LoginRepoImpl extends LoginRepo{
  @factoryMethod
  LoginDatasource apiDatasource;
  LoginRepoImpl(this.apiDatasource);


  @override
  Future<ApiResult<LoginResponse>> Login({required String email, required String password}) async{
    var response=await apiDatasource.Login(email: email, password: password);

      return response;




  }


 }