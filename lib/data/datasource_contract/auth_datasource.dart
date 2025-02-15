import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';

abstract class AuthDatasource{

  Future<Either<AuthResponseModel,String>> Login({required String email ,required String password});
  Future<Either<AuthResponseModel,String>> SignUp({
    required  String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });


}