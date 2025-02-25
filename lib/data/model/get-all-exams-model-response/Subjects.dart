import 'package:online_exam/domain/entity/get_all_exams_entity/subjects_entity.dart';

/// _id : "670037f6728c92b7fdf434fc"
/// name : "HTML"
/// icon : "https://exam.elevateegy.com/uploads/categories/6751d734cc3deba60dd5bc80-item_1.png"
/// createdAt : "2024-10-04T18:46:14.281Z"

class Subjects {
  Subjects({
      this.id, 
      this.name, 
      this.icon, 
      this.createdAt,});

  Subjects.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? name;
  String? icon;
  String? createdAt;
Subjects copyWith({  String? id,
  String? name,
  String? icon,
  String? createdAt,
}) => Subjects(  id: id ?? this.id,
  name: name ?? this.name,
  icon: icon ?? this.icon,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['createdAt'] = createdAt;
    return map;
  }

  SubjectsEntity toSubjectEntity(){
    return SubjectsEntity(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }

}