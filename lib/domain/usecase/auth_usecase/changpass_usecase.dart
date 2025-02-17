import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entity/Auth/change_pass_response_entity.dart';

import '../../entity/Auth/auth_response.dart';
import '../../repo_contract/auth_repo.dart';

@injectable
class ChangpassUsecase {
  AuthRepo changPassRepo;

  ChangpassUsecase(this.changPassRepo);

  Future<Either<ChangePassResponseEntity, String>> call(
      {required String message, required String token}) {
    return changPassRepo.ChangePass(message: message, token: token);
  }
}
