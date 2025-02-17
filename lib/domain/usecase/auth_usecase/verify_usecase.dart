
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/repo_contract/auth_repo.dart';

import '../../../core/api/api_result.dart';
import '../../entity/Auth/verify_response_entity/verify_response.dart';

@injectable
class VerifyUsecase{
  @factoryMethod
  AuthRepo verifyRepo;
  VerifyUsecase(this.verifyRepo);
  Future<ApiResult<VerifyResponseEntity>> call({required  String resetCode}){
    return verifyRepo.Verification(resetCode: resetCode);
  }
}