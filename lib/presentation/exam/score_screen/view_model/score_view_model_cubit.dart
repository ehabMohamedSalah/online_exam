import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';
import 'package:online_exam/domain/usecase/question_usecase/check_question_usecase.dart';
part 'score_view_model_state.dart';

class ScoreViewModelCubit extends Cubit<ScoreViewModelState> {
  CheckQuestionUsecase checkQuestionUsecase;

  ScoreViewModelCubit(this.checkQuestionUsecase)
      : super(ScoreViewModelInitial());

  Future<void> postCheckQuestion({
    required num correct,
    required num wrong,
    required String total,
  }) async {
    emit(Scoreloading());
    print("🚀 Sending request with: correct=$correct, wrong=$wrong, total=$total");

    var response = await checkQuestionUsecase.call(correct: correct, wrong: wrong, total: total);

    if (response is SuccessApiResult<CheckQuestionResponseEntity>) {
      print("✅ Success: ${response.data?.message}");
      emit(ScoreSuccess(response));
    } else if (response is ErrorApiResult<CheckQuestionResponseEntity>) {
      print("❌ Error: ${response.exception}");
      emit(ScoreErorr(response));
    }
  }

}
