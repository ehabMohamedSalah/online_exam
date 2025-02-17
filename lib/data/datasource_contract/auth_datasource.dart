import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';
import 'package:online_exam/data/model/Auth/change_password/change_pass_response.dart';
import 'package:online_exam/data/model/Auth/forget_passowrd/forget_password_response.dart';
import 'package:online_exam/data/model/Auth/verify_code/verify_response.dart';

abstract class AuthDatasource {
  Future<Either<AuthResponseModel, String>> Login(
      {required String email, required String password});

  Future<Either<AuthResponseModel, String>> SignUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });

  Future<Either<ChangePassResponse, String>> ChangePass(
      {required String message, required String token});

  Future<Either<ForgetPasswordResponse, String>> ForgetPass(
      {required String message, required String info, required int code});

  Future<Either<VerifyResponse, String>> VerifyCode(
      {required String status});
}
