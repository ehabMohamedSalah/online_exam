

import 'package:online_exam/domain/entity/get_all_exams_entity/subjects_entity.dart';

import '../../../data/model/get-all-exams-model-response/Metadata.dart';

/// message : "success"
/// code : 401
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// subjects : [{"_id":"670037f6728c92b7fdf434fc","name":"HTML","icon":"https://exam.elevateegy.com/uploads/categories/6751d734cc3deba60dd5bc80-item_1.png","createdAt":"2024-10-04T18:46:14.281Z"},{"_id":"670038f7728c92b7fdf43501","name":"CSS","icon":"https://exam.elevateegy.com/uploads/categories/6751d73fcc3deba60dd5bc84-item_2.png","createdAt":"2024-10-04T18:50:31.606Z"},{"_id":"670039c3728c92b7fdf43506","name":"Javascript","icon":"https://exam.elevateegy.com/uploads/categories/6751d74ccc3deba60dd5bc88-item_3.png","createdAt":"2024-10-04T18:53:55.992Z"},{"_id":"67003a9a728c92b7fdf4350a","name":"Angular","icon":"https://exam.elevateegy.com/uploads/categories/6751d758cc3deba60dd5bc8c-item_4.png","createdAt":"2024-10-04T18:57:30.499Z"},{"_id":"67003aad728c92b7fdf4350e","name":"React","icon":"https://exam.elevateegy.com/uploads/categories/6751d766cc3deba60dd5bc91-item_5.png","createdAt":"2024-10-04T18:57:49.959Z"},{"_id":"67003b69728c92b7fdf43512","name":"Flutter","icon":"https://exam.elevateegy.com/uploads/categories/6751d773cc3deba60dd5bc95-item_6.png","createdAt":"2024-10-04T19:00:57.863Z"},{"_id":"67abb2a486a024f06ea25f35","name":"Routee22","icon":"https://exam.elevateegy.com/uploads/categories/67abb2a486a024f06ea25f33-IMG_20230624_055207_418.jpg","createdAt":"2025-02-11T20:27:16.278Z"},{"_id":"67abb30886a024f06ea25f44","name":"PeshoO","icon":"https://exam.elevateegy.com/uploads/categories/67abb30886a024f06ea25f42-IMG_20230624_055207_418.jpg","createdAt":"2025-02-11T20:28:56.320Z"}]

class GetAllExamResponseEntity {
  GetAllExamResponseEntity({
    this.message,
    this.code,
    this.metadata,
    this.subjects,});

   String? message;
  int? code;
  Metadata? metadata;
  List<SubjectsEntity>? subjects;



}