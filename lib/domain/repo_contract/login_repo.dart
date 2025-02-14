import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/login/LoginResponse.dart';
import 'package:online_exam/domain/entity/Auth/login_response_entity/login_response.dart';

abstract class LoginRepo{
  Future<Either<LoginResponseEntity,String>>Login({required String email,required String password});
}