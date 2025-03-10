import 'package:flutter/material.dart';

class CustomResultCard extends StatelessWidget {

  String text;
  String image;
  String quizTime;
  String time;
  String correctNumber;
  String questionNumber;
  void Function()? onTap;


  CustomResultCard({required this.text,required this.image,required this.onTap,required  this.quizTime,required this.questionNumber,required this.time,required this.correctNumber});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey, // Shadow color
              blurRadius: 0.5, // Softness of shadow
              offset: Offset(2, 4), // Position of shadow
            ),
          ],
        ),
        width: double.infinity,
        height: 120,
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 15,right: 15,left: 15,bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(image,width: 80,height: 80,),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${quizTime} Minutes",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${questionNumber} Questions",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${correctNumber} corrected answers in ${time} min.",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}