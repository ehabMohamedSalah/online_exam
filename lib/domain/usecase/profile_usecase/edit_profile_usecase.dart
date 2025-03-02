import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/user_profile_entity.dart';
import 'package:online_exam/domain/repo_contract/profile_repo.dart';

@injectable
class EditProfileUsecase {
  final ProfileRepo profileRepo;

  EditProfileUsecase(this.profileRepo);

  Future<ApiResult<UserProfileEntity>> call(
      {required String id,
      required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String phone}) {
    return profileRepo.putEditProfile(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone);
  }
}
