part of 'reset_password_view_model_cubit.dart';

@immutable
sealed class ResetPasswordViewModelState {}

final class ResetPasswordViewModelInitial extends ResetPasswordViewModelState {}
class ResetPasswordloading extends ResetPasswordViewModelState{}

class ResetPasswordSuccess extends ResetPasswordViewModelState{
  SuccessApiResult<ResetPasswordResponseEntity> response;
  ResetPasswordSuccess(this.response);
}
class ResetPasswordErorr extends ResetPasswordViewModelState{
  ErrorApiResult exp;
  ResetPasswordErorr(this.exp);
}