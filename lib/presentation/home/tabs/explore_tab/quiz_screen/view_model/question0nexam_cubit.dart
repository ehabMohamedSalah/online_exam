import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../data/model/question_on_exam/QuestionOnExamResponse.dart';
import '../../../../../../domain/usecase/question_onexam_usecase.dart';

part 'question0nexam_state.dart';

@injectable
class Question0nexamCubit extends Cubit<Question0nexamState> {
  QuestionOnexamUsecase questionOnexamUsecase;
  Question0nexamCubit(this.questionOnexamUsecase) : super(Question0nexamInitial());

  static Question0nexamCubit get(context){
    return BlocProvider.of(context);
  }

  Future<void> getQuestion({required String examID})async{
    emit(QuestionOnExamLoadingState());
    print("🚀 Forget Password Request Started...");

    var response=await questionOnexamUsecase.call(examID: examID);
    if(response is SuccessApiResult<QuestionOnExamResponse>){
      print("✅ Success: ${response.data?.questions?[0].question} 3adaa yastaaaa");
      emit(QuestionOnExamSuccessState(response));
    }else if(response is ErrorApiResult<QuestionOnExamResponse>){
      print("❌ Error: ${response.exception}");
      emit(QuestionOnExamErrorState(response.exception.toString()));
    }
  }
}
