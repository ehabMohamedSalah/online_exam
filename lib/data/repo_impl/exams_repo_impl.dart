
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/datasource_contract/subjects_datasource.dart';
import 'package:online_exam/domain/entity/get_all_exams_entity/get_all_exam_entity.dart';

import '../../domain/repo_contract/subject_repo.dart';

@Injectable(as: SubjectRepo)
class SubjectRepoImpl extends SubjectRepo{
  SubjectDataSource subjectDataSource;
  SubjectRepoImpl(this.subjectDataSource);
  @override
  Future<ApiResult<GetAllExamResponseEntity>> GetAllSubject() {
    return subjectDataSource.GetAllSubject();
  }

}