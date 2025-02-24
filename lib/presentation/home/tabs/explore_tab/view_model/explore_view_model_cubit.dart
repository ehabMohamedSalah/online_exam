import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain/entity/get_all_exams_entity/get_all_exam_entity.dart';
import 'package:online_exam/domain/usecase/get_all_exam_usecase.dart';

import '../../../../../core/api/api_result.dart';

part 'explore_view_model_state.dart';

@injectable
class ExploreViewModelCubit extends Cubit<ExploreViewModelState> {
  GetAllExamsUsecase getAllExamsUsecase;
  @factoryMethod
  ExploreViewModelCubit(this.getAllExamsUsecase) : super(ExploreViewModelInitial());


  static ExploreViewModelCubit get(context) {
    return BlocProvider.of(context);
  }


  Future<void> getAllExams() async {
    emit(ExploreLoadingState());
    print("🚀 Forget Password Request Started...");

    var response = await getAllExamsUsecase.call();

    if (response is SuccessApiResult<GetAllExamResponseEntity>) {
      print("✅ Success: ${response.data?.message}");
      emit(ExploreSuccessState(response));
    } else if (response is ErrorApiResult<GetAllExamResponseEntity>) {
      print("❌ Error: ${response.exception}");
      emit(ExploreErrorState(response));
    }
  }
}



