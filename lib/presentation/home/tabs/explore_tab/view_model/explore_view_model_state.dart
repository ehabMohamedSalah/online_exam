part of 'explore_view_model_cubit.dart';

@immutable
sealed class ExploreViewModelState {}

final class ExploreViewModelInitial extends ExploreViewModelState {}
 class ExploreLoadingState extends ExploreViewModelState{}
class ExploreSuccessState extends ExploreViewModelState{
  SuccessApiResult<GetAllExamResponseEntity> response;
  ExploreSuccessState(this.response);
}
class ExploreErrorState extends ExploreViewModelState{
  ErrorApiResult exp;
  ExploreErrorState(this.exp);

}

