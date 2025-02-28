import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/profile_response_entity.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/user_profile_entity.dart';
import 'package:online_exam/domain/repo_contract/profile_repo.dart';

@injectable
class ProfileInfoUsecase {
  final ProfileRepo profileRepo;

  ProfileInfoUsecase(this.profileRepo);

  Future<ApiResult<ProfileResponseEntity>> call({required String id}) async {
    var result = await profileRepo.getProfileInfo(id: id);

    if (result is SuccessApiResult<UserProfileEntity>) {
      ProfileResponseEntity profileResponseEntity = ProfileResponseEntity(
        user: result.data,
      );
      return SuccessApiResult(profileResponseEntity);
    } else if (result is ErrorApiResult<UserProfileEntity>) {
      return ErrorApiResult(result.exception);
    }

    return ErrorApiResult(Exception("Unexpected error"));
  }
}
