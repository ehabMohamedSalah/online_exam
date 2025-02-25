part of 'subject_on_exam_cubit.dart';

@immutable
sealed class SubjectOnExamState {}

final class SubjectOnExamInitial extends SubjectOnExamState {}
class SubjectOnExamLoadingState extends SubjectOnExamState{}
class SubjectOnExamSuccessState extends SubjectOnExamState{
  SuccessApiResult<GetAllExamsOnSubjectEntity> response;
  SubjectOnExamSuccessState(this.response);
}
class SubjectOnExamErrorState extends SubjectOnExamState{
  ErrorApiResult exp;
  SubjectOnExamErrorState(this.exp);
}