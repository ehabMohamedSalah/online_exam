part of 'forget_password_view_model_cubit.dart';

@immutable
sealed class ForgetPasswordViewModelState {}

final class ForgetPasswordInitial extends ForgetPasswordViewModelState {}
class ForgetPasswordloading extends ForgetPasswordViewModelState{}

class ForgetPasswordSuccess extends ForgetPasswordViewModelState{
  SuccessApiResult<ForgetPasswordEntity> response;
  ForgetPasswordSuccess(this.response);
}
class ForgetPasswordErorr extends ForgetPasswordViewModelState{
  ErrorApiResult exp;
  ForgetPasswordErorr(this.exp);
}