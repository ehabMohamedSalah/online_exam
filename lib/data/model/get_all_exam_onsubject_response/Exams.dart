import '../../../domain/entity/get_all_exam_on_Subject_entity_response/exams_entity.dart';

/// _id : "6700708d30a3c3c1944a9c60"
/// title : "CSS Quiz"
/// duration : 20
/// subject : "670038f7728c92b7fdf43501"
/// numberOfQuestions : 25
/// active : true
/// createdAt : "2024-10-04T22:47:41.364Z"

class Exams {
  Exams({
      this.id, 
      this.title, 
      this.duration, 
      this.subject, 
      this.numberOfQuestions, 
      this.active, 
      this.createdAt,});

  Exams.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;
Exams copyWith({  String? id,
  String? title,
  int? duration,
  String? subject,
  int? numberOfQuestions,
  bool? active,
  String? createdAt,
}) => Exams(  id: id ?? this.id,
  title: title ?? this.title,
  duration: duration ?? this.duration,
  subject: subject ?? this.subject,
  numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
  active: active ?? this.active,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['duration'] = duration;
    map['subject'] = subject;
    map['numberOfQuestions'] = numberOfQuestions;
    map['active'] = active;
    map['createdAt'] = createdAt;
    return map;
  }
  ExamsEntity toExamsEntity(){
    return ExamsEntity(
      createdAt: createdAt,
      id: id,
      title: title,
      active: active,
      duration: duration,
      numberOfQuestions: numberOfQuestions,
      subject: subject,
    );
  }


}