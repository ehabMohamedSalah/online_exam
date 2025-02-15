import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/LoginResponse.dart';
import 'package:online_exam/domain/entity/Auth/login_response_entity/login_response.dart';

import '../../core/api/api_result.dart';

abstract class LoginRepo{
  Future<ApiResult<LoginResponse>> Login({required String email,required String password});
}