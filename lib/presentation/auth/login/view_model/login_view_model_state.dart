part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}

class Loginloading extends LoginViewModelState{}
class LoginErorr extends LoginViewModelState{
  String ErrorMessage;
  LoginErorr(this.ErrorMessage);
}
class LoginSuccess extends LoginViewModelState{
  LoginResponseEntity AuthEntity;
  LoginSuccess(this.AuthEntity);
}
