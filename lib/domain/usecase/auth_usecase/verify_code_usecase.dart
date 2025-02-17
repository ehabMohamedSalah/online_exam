import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity.dart';

import '../../entity/Auth/auth_response.dart';
import '../../repo_contract/auth_repo.dart';

@injectable
class VerifyCodeUsecase {
  AuthRepo verifyCodeRepo;

  VerifyCodeUsecase(this.verifyCodeRepo);

  Future<Either<VerifyResponseEntity, String>> call({required String status}) {
    return verifyCodeRepo.VerifyCode(status: status);
  }
}
