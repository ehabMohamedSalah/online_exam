import '../../core/api/api_result.dart';
import '../entity/get_all_exams_entity/get_all_exam_entity.dart';

abstract class SubjectRepo{

  Future<ApiResult<GetAllExamResponseEntity>> GetAllSubject();
}
