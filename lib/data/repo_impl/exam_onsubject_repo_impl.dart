
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/datasource_contract/exams_onsubject_datasource.dart';
import 'package:online_exam/domain/entity/get_all_exam_on_Subject_entity_response/get_all_exam_obSubject_entity.dart';

import '../../domain/repo_contract/exam_onsubject_repo.dart';
import '../model/get_all_exam_onsubject_response/GetAllExamsOnSubjectResponse.dart';
@Injectable(as: ExamOnSubjectRepo)
class ExamOnSubjectRepoImpl extends ExamOnSubjectRepo{
  ExamsOnSubjectsDatasource examsOnSubjectsDatasource;
  ExamOnSubjectRepoImpl(this.examsOnSubjectsDatasource);
  @override
  Future<ApiResult<GetAllExamsOnSubjectResponse>> GetExamsOnSubjects({required String subjectID}) {
    return examsOnSubjectsDatasource.GetExamsOnSubjects(subjectID: subjectID);
  }

}