import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';
import 'package:online_exam/domain/entity/Auth/auth_response.dart';

abstract class AuthRepo{
  Future<Either<AuthResponseEntity,String>>Login({required String email,required String password});
  Future<Either<AuthResponseEntity,String>> SignUp({
    required  String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
}