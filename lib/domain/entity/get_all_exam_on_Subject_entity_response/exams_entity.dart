/// _id : "6700708d30a3c3c1944a9c60"
/// title : "CSS Quiz"
/// duration : 20
/// subject : "670038f7728c92b7fdf43501"
/// numberOfQuestions : 25
/// active : true
/// createdAt : "2024-10-04T22:47:41.364Z"

class ExamsEntity {
  ExamsEntity({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,});


  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;


}