part of 'question0nexam_cubit.dart';

@immutable
sealed class Question0nexamState {}

final class Question0nexamInitial extends Question0nexamState {}
class QuestionOnExamLoadingState extends Question0nexamState{}

class QuestionOnExamSuccessState extends Question0nexamState{
  SuccessApiResult<QuestionOnExamResponse> response;
  QuestionOnExamSuccessState(this.response);
}
class QuestionOnExamErrorState extends Question0nexamState{
  String errMessage;
  QuestionOnExamErrorState(this.errMessage);
}