import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerScreen extends StatefulWidget {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String selectedOption;

  const AnswerScreen({
    super.key,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.selectedOption,
  });

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Answers",
          style: GoogleFonts.merriweather(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.white70,
                  blurRadius: 0.5,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.question,
                    style: GoogleFonts.merriweather(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.options.length,
                      itemBuilder: (context, index) {
                        String option = widget.options[index];
                        Color backColor = (Color(0XFFE9E9E9));
                        Color bordColor = (Color(0XFFE9E9E9));
                        bool isSelected = false;

                        if (option == widget.selectedOption) {
                          if (widget.selectedOption == widget.correctAnswer) {
                            backColor = Colors.green;
                            bordColor = Colors.green.shade100;
                            isSelected = true;
                          } else {
                            backColor = Colors.red;
                            bordColor = Colors.red.shade100;
                            isSelected = true;
                          }
                        }

                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: option == widget.correctAnswer ? Colors.green.shade100 : bordColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: option == widget.correctAnswer ? Colors.green : backColor,
                              width: 2,
                            ),
                          ),
                          child: CheckboxListTile(
                            title: Text(
                              option,
                              style: GoogleFonts.merriweather(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: isSelected,
                            onChanged: null, // تعطيل الاختيار لأن المستخدم قام بالإجابة بالفعل
                            checkColor: Colors.white,
                            activeColor: backColor,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}