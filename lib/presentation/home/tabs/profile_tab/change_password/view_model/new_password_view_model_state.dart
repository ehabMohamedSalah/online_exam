part of 'new_password_view_model_cubit.dart';

@immutable
sealed class NewPasswordViewModelState {}

final class NewPasswordViewModelInitial extends NewPasswordViewModelState {}

class NewPasswordloading extends NewPasswordViewModelState {}

class NewPasswordSuccess extends NewPasswordViewModelState {
  SuccessApiResult<ChangePassowrdResponseEntity> response;

  NewPasswordSuccess(this.response);
}

class NewPasswordErorr extends NewPasswordViewModelState {
  ErrorApiResult exp;

  NewPasswordErorr(this.exp);
}
