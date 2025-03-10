import '../../core/api/api_result.dart';
import '../../data/model/get_all_exam_onsubject_response/GetAllExamsOnSubjectResponse.dart';
import '../entity/get_all_exam_on_Subject_entity_response/get_all_exam_obSubject_entity.dart';

abstract class ExamOnSubjectRepo{
  Future<ApiResult<GetAllExamsOnSubjectResponse>> GetExamsOnSubjects({required String subjectID});

}
