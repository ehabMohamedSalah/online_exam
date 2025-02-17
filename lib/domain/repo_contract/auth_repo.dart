import 'package:dartz/dartz.dart';
import 'package:online_exam/domain/entity/Auth/auth_response.dart';
import 'package:online_exam/domain/entity/Auth/change_pass_response_entity.dart';
import 'package:online_exam/domain/entity/Auth/forget_password_response_entity.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity.dart';

abstract class AuthRepo {
  Future<Either<AuthResponseEntity, String>> Login(
      {required String email, required String password});

  Future<Either<AuthResponseEntity, String>> SignUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });

  Future<Either<ChangePassResponseEntity, String>> ChangePass(
      {required String message, required String token});

  Future<Either<ForgetPasswordResponseEntity, String>> ForgetPass(
      {required String message, required String info, required int code});

  Future<Either<VerifyResponseEntity, String>> VerifyCode(
      {required String status});
}
