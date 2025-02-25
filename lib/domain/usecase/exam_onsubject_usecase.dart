
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/repo_contract/exam_onsubject_repo.dart';

import '../../core/api/api_result.dart';
import '../entity/get_all_exam_on_Subject_entity_response/get_all_exam_obSubject_entity.dart';

@injectable
class ExamOnsubjectUsecase{
  ExamOnSubjectRepo examOnSubjectRepo;
  ExamOnsubjectUsecase(this.examOnSubjectRepo);

  Future<ApiResult<GetAllExamsOnSubjectEntity>> call ({required String subjectID}){
    return examOnSubjectRepo.GetExamsOnSubjects(subjectID: subjectID);
  }

}