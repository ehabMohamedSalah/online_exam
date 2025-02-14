import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/login/LoginResponse.dart';

abstract class LoginDatasource{

  Future<Either<LoginResponse,String>> Login({required String email ,required String password});

}