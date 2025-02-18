import 'package:dartz/dartz.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/model/Auth/authResponse.dart';
import 'package:online_exam/domain/entity/Auth/reset_pass_response_entity/reset_passowrd_response_entity.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';

import '../../domain/entity/Auth/foreget_pass_entity/ForgetPassEntity.dart';
import '../model/Auth/forget_passowrd/ForgetPasswordResponse.dart';

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
  Future<ApiResult<ForgetPasswordEntity>> ForgetPassword({required String email });
 Future<ApiResult<VerifyResponseEntity>> Verification({required String resetCode});
  Future<ApiResult<ResetPasswordResponseEntity>> ResetPassword({required String email,required String NewPassword});

}