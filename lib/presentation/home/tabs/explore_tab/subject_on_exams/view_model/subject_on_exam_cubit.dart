import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain/entity/get_all_exam_on_Subject_entity_response/get_all_exam_obSubject_entity.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../data/model/get_all_exam_onsubject_response/GetAllExamsOnSubjectResponse.dart';
import '../../../../../../domain/usecase/exam_onsubject_usecase.dart';

part 'subject_on_exam_state.dart';
@injectable
class SubjectOnExamCubit extends Cubit<SubjectOnExamState> {
  ExamOnsubjectUsecase examOnsubjectUsecase;
  SubjectOnExamCubit(this.examOnsubjectUsecase) : super(SubjectOnExamInitial());

  static SubjectOnExamCubit get(context) {
    return BlocProvider.of(context);
  }


  Future<void> getAllExamsOnSubject({required String subjectID}) async {
    emit(SubjectOnExamLoadingState());
    print("🚀 Forget Password Request Started...");

    var response = await examOnsubjectUsecase.call(subjectID:subjectID );

    if (response is SuccessApiResult<GetAllExamsOnSubjectResponse>) {
      print("✅ Success: ${response.data?.message}");
      emit(SubjectOnExamSuccessState(response));
    } else if (response is ErrorApiResult<GetAllExamsOnSubjectResponse>) {
      print("❌ Error: ${response.exception}");
      emit(SubjectOnExamErrorState(response));
    }
  }
}
