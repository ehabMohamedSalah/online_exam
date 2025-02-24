import 'package:injectable/injectable.dart';
import '../../core/api/api_result.dart';
import '../entity/get_all_exams_entity/get_all_exam_entity.dart';
import '../repo_contract/subject_repo.dart';

@injectable
class GetAllExamsUsecase{
  SubjectRepo subjectRepo;
  GetAllExamsUsecase(this.subjectRepo);
  Future<ApiResult<GetAllExamResponseEntity>> call(){
    return subjectRepo.GetAllSubject();
  }
}