part of 'score_view_model_cubit.dart';

@immutable
sealed class ScoreViewModelState {}

final class ScoreViewModelInitial extends ScoreViewModelState {}

class Scoreloading extends ScoreViewModelState {}

class ScoreSuccess extends ScoreViewModelState {
  SuccessApiResult<CheckQuestionResponseEntity> response;

  ScoreSuccess(this.response);
}

class ScoreErorr extends ScoreViewModelState {
  ErrorApiResult exp;

  ScoreErorr(this.exp);
}
