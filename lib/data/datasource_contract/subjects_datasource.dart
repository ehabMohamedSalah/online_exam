import '../../core/api/api_result.dart';
import '../../domain/entity/get_all_exams_entity/get_all_exam_entity.dart';

abstract class SubjectDataSource{


  Future<ApiResult<GetAllExamResponseEntity>> GetAllSubject();

}