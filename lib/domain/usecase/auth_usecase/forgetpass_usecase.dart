import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entity/Auth/forget_password_response_entity.dart';

import '../../repo_contract/auth_repo.dart';

@injectable
class ForgetpassUsecase {
  AuthRepo forgetPassRepo;

  ForgetpassUsecase(this.forgetPassRepo);

  Future<Either<ForgetPasswordResponseEntity, String>> call(
      {required String message, required String info, required int code}) {
    return forgetPassRepo.ForgetPass(message: message, info: info, code: code);
  }
}
