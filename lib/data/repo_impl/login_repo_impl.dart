import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/datasource_contract/login_datasource.dart';
import 'package:online_exam/domain/entity/Auth/login_response_entity/login_response.dart';
import 'package:online_exam/domain/repo_contract/login_repo.dart';


@Injectable(as: LoginRepo)
class LoginRepoImpl extends LoginRepo{
  @factoryMethod
  LoginDatasource apiDatasource;
  LoginRepoImpl(this.apiDatasource);


  @override
  Future<Either<LoginResponseEntity, String>> Login({required String email, required String password}) async{
    var response=await apiDatasource.Login(email: email, password: password);
    return response.fold(
            (response) {
              LoginResponseEntity loginResponseEntity=response.toLoginResponseEntity();
              return left(loginResponseEntity);
            },
            (err) => right(err),

    );

  }


 }