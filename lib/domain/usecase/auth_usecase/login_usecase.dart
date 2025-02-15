import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entity/Auth/auth_response.dart';
import '../../repo_contract/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<AuthResponseEntity, String>> call(
      {required String email, required String password}) {
    return loginRepo.Login(email: email, password: password);
  }
}