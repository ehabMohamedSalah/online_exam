import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/LoginResponse.dart';

import '../../core/api/api_result.dart';

abstract class LoginDatasource{

  Future<ApiResult<LoginResponse>> Login({required String email ,required String password});

}