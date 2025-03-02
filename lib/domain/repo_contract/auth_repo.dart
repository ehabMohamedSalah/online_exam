import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';
import 'package:online_exam/domain/entity/Auth/auth_response/auth_response.dart';

import '../../core/api/api_result.dart';
import '../../data/model/Auth/forget_passowrd/forget_password_response.dart';
import '../entity/Auth/foreget_pass_entity/forget_pass_entity.dart';
import '../entity/Auth/reset_pass_response_entity/reset_passowrd_response_entity.dart';
import '../entity/Auth/verify_response_entity/verify_response.dart';

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
  Future<ApiResult<ForgetPasswordEntity>> ForgetPassword({required String email });
  Future<ApiResult<VerifyResponseEntity>> Verification({required String resetCode});
  Future<ApiResult<ResetPasswordResponseEntity>> ResetPassword({required String email,required String NewPassword});

}