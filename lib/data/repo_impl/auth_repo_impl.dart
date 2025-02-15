import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/datasource_contract/auth_datasource.dart';
import 'package:online_exam/domain/entity/Auth/auth_response.dart';

import '../../domain/repo_contract/auth_repo.dart';
 

@Injectable(as: AuthRepo)
class LoginRepoImpl extends AuthRepo{
  @factoryMethod
  AuthDatasource apiDatasource;
  LoginRepoImpl(this.apiDatasource);


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


 }