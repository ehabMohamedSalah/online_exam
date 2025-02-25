import '../../core/api/api_result.dart';
import '../../domain/entity/get_all_exam_on_Subject_entity_response/get_all_exam_obSubject_entity.dart';

abstract class ExamsOnSubjectsDatasource{
  Future<ApiResult<GetAllExamsOnSubjectEntity>> GetExamsOnSubjects({required String subjectID});
}