import 'package:online_exam/domain/entity/get_all_exam_on_Subject_entity_response/get_all_exam_obSubject_entity.dart';
import 'package:online_exam/domain/entity/get_all_exams_entity/get_all_exam_entity.dart';

import 'Metadata.dart';
import 'Exams.dart';

/// message : "success"
/// code : 500
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// exams : [{"_id":"6700708d30a3c3c1944a9c60","title":"CSS Quiz","duration":20,"subject":"670038f7728c92b7fdf43501","numberOfQuestions":25,"active":true,"createdAt":"2024-10-04T22:47:41.364Z"}]

class GetAllExamsOnSubjectResponse {
  GetAllExamsOnSubjectResponse({
      this.message, 
      this.code, 
      this.metadata, 
      this.exams,});

  GetAllExamsOnSubjectResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['exams'] != null) {
      exams = [];
      json['exams'].forEach((v) {
        exams?.add(Exams.fromJson(v));
      });
    }
  }
  String? message;
  int? code;
  Metadata? metadata;
  List<Exams>? exams;
GetAllExamsOnSubjectResponse copyWith({  String? message,
  int? code,
  Metadata? metadata,
  List<Exams>? exams,
}) => GetAllExamsOnSubjectResponse(  message: message ?? this.message,
  code: code ?? this.code,
  metadata: metadata ?? this.metadata,
  exams: exams ?? this.exams,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (exams != null) {
      map['exams'] = exams?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  GetAllExamsOnSubjectEntity toGetAllExamsOnSubjectResponse(){
    return GetAllExamsOnSubjectEntity(
       message: message,
      code: code,
       exams:exams?.map((exam) => exam.toExamsEntity()).toList(),

    );
  }
}