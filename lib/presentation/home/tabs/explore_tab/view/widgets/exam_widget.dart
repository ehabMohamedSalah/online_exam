import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../domain/entity/get_all_exam_on_Subject_entity_response/exams_entity.dart';

class ExamWidget extends StatelessWidget {
  ExamsEntity examItem;
  ExamWidget(this.examItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            width: 60.w, // Adjust width as needed
            height: 80.h, // Adjust height as needed
            child: Image.asset("assets/images/Profit.png"),
          ),

           Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Push question text to the bottom
            children: [
              Text(
                examItem.title ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 8), // Adds space between title and number of questions

              Text(
                "${examItem.numberOfQuestions} ${examItem.numberOfQuestions == 1 ? 'Question' : 'Questions'}",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),

           Column(
            crossAxisAlignment: CrossAxisAlignment.end, // Aligns text to the right
            children: [
              Text(
                "${examItem.duration} Minutes",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
