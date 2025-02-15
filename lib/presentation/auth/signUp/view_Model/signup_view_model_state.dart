part of 'signup_view_model_cubit.dart';

@immutable
sealed class SignupViewModelState {}

final class SignupViewModelInitial extends SignupViewModelState {}
class Signuploading extends SignupViewModelState{}
class SignupErorr extends SignupViewModelState{
  String ErrorMessage;
  SignupErorr(this.ErrorMessage);
}
class SignupSuccess extends SignupViewModelState{
  AuthResponseEntity AuthEntity;
  SignupSuccess(this.AuthEntity);
}
