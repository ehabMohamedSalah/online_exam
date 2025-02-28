import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/user_profile_entity.dart';
import 'package:online_exam/domain/usecase/profile_usecase/edit_profile_usecase.dart';

part 'edit_profile_view_model_state.dart';

@injectable
class EditProfileViewModelCubit extends Cubit<EditProfileViewModelState> {
  final EditProfileUsecase editProfileUsecase;

  EditProfileViewModelCubit(this.editProfileUsecase)
      : super(EditProfileViewModelInitial());

  static EditProfileViewModelCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> putEditProfile({
    required String id,
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(EditProfileloading());
    print("🚀 Edit Profile Request Started...");
    var response = await editProfileUsecase.call(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );

    if (response is SuccessApiResult<UserProfileEntity>) {
      print("✅ Success: Profile updated successfully!");
      emit(EditProfileSuccess(response.data!));
    } else if (response is ErrorApiResult<UserProfileEntity>) {
      print("❌ Error: ${response.exception}");
      emit(EditProfileErorr(response.exception.toString()));
    }
  }
}
