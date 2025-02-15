part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}

class Loginloading extends LoginViewModelState{}
class LoginErorr extends LoginViewModelState{
  ErrorApiResult exp;
  LoginErorr(this.exp);
}
class LoginSuccess extends LoginViewModelState{
  SuccessApiResult<LoginResponse> response;
  LoginSuccess(this.response);
}