import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/resuable-comp/custom_text_field.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';

import '../../../../../domain/entity/get_all_exam_on_Subject_entity_response/exams_entity.dart';

class StartExamScreen extends StatelessWidget {
  ExamsEntity exam;
  StartExamScreen(this.exam);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          
        }, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(
                  width: 60.w, // Adjust width as needed
                  height: 80.h, // Adjust height as needed
                  child: Image.asset("assets/images/Profit.png"),
                ),
                  Text(
                    exam.title ?? "",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

              ],),
                Row(
                 children: [
                   Text(
                     "${exam.duration} Minutes",
                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                   ),
                 ],
                ),
            ],),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text(
                  "High Level",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  " | ${exam.numberOfQuestions} ${exam.numberOfQuestions == 1 ? 'Question' : 'Questions'}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 24.h,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Instructions",style: Theme.of(context).textTheme.labelLarge,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("• Read all exam instructions carefully.", style: TextStyle(fontSize: 16, color: Colors.grey)),
                 Text("• Test your technical setup.", style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text("• Stay calm and focused.", style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text("• Do not refresh or close the exam page.", style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text("• Review your answers before submitting.", style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 50,),
            CustomTextButton(onPressed: (){}, text: "Start"),
          ],
        ),
      ),
    );
  }
}
