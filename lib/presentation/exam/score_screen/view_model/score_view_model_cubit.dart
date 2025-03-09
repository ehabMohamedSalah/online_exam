import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/exam/check_question/check_question_response_entity.dart';
import 'package:online_exam/domain/usecase/question_usecase/check_question_usecase.dart';
part 'score_view_model_state.dart';

@injectable
class ScoreViewModelCubit extends Cubit<ScoreViewModelState> {
  CheckQuestionUsecase checkQuestionUsecase;

  ScoreViewModelCubit(this.checkQuestionUsecase)
      : super(ScoreViewModelInitial());

   postCheckQuestion({
    required List<Map<String, String>> answers,
    required int time,
  }) async {
    emit(Scoreloading());


    var response = await checkQuestionUsecase.call(answers: answers, time: time);

    if (response is SuccessApiResult<CheckQuestionResponseEntity>) {
      print("✅ Success: ${response.data?.message}");
      emit(ScoreSuccess(response));
    } else if (response is ErrorApiResult<CheckQuestionResponseEntity>) {
      print("❌ Error: ${response.exception}");
      emit(ScoreErorr(response));
    }
  }

}
