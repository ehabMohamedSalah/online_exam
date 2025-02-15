import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/repo_contract/login_repo.dart';

import '../../core/api/api_result.dart';
import '../../data/model/Auth/LoginResponse.dart';
import '../entity/Auth/login_response_entity/login_response.dart';

@injectable
class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<ApiResult<LoginResponse>> call(
      {required String email, required String password}) {
    return loginRepo.Login(email: email, password: password);
  }
}