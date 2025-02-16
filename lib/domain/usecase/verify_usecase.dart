import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';
import 'package:online_exam/domain/repo_contract/verify_repo.dart';

@injectable
class VerifyUseCase {
  VerifyRepo verifyRepo;

  VerifyUseCase(this.verifyRepo);

  Future<Either<VerifyResponseEntity, String>> call(
      {required String resetCode}) {
    return verifyRepo.Verify(resetCode: resetCode);
  }
}
