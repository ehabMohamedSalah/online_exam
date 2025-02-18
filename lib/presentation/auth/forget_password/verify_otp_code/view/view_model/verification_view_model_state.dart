part of 'verification_view_model_cubit.dart';

@immutable
sealed class VerificationViewModelState {}

final class VerificationInitial extends VerificationViewModelState {}
class VerficationLoading extends VerificationViewModelState{}

class VerificationSuccess extends VerificationViewModelState{
  SuccessApiResult<VerifyResponseEntity> response;
  VerificationSuccess(this.response);
}
class VerificationError extends VerificationViewModelState{
  ErrorApiResult exp;
  VerificationError(this.exp);
}