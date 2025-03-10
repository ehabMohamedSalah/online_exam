

import 'package:online_exam/data/model/get_all_exam_onsubject_response/Exams.dart';
import 'package:online_exam/domain/entity/get_all_exam_on_Subject_entity_response/exams_entity.dart';

import '../../../data/model/get-all-exams-model-response/Metadata.dart';

/// message : "success"
/// code : 500
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// exams : [{"_id":"6700708d30a3c3c1944a9c60","title":"CSS Quiz","duration":20,"subject":"670038f7728c92b7fdf43501","numberOfQuestions":25,"active":true,"createdAt":"2024-10-04T22:47:41.364Z"}]

class GetAllExamsOnSubjectEntity {
  GetAllExamsOnSubjectEntity({
    this.message,
    this.code,
    this.metadata,
    this.exams,});

   String? message;
  int? code;
  Metadata? metadata;
  List<Exams>? exams;


}