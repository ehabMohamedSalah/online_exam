part of 'edit_profile_view_model_cubit.dart';

@immutable
sealed class EditProfileViewModelState {}

class EditProfileViewModelInitial extends EditProfileViewModelState {}

class EditProfileloading extends EditProfileViewModelState {}

class EditProfileSuccess extends EditProfileViewModelState {
  final UserProfileEntity userProfile;
  EditProfileSuccess(this.userProfile);
}

class EditProfileErorr extends EditProfileViewModelState {
  final String message;
  EditProfileErorr(this.message);
}
