/// QID : "6700829e0a5849a4aee16297"
/// Question : "Who is making the Web standards?"
/// inCorrectAnswer : "A2"
/// correctAnswer : "A4"
/// answers : {}

class WrongQuestionsEntity {
  String? qid;
  String? question;
  String? inCorrectAnswer;
  String? correctAnswer;
  dynamic answers;

  WrongQuestionsEntity(
      {this.qid,
      this.question,
      this.inCorrectAnswer,
      this.correctAnswer,
      this.answers});
}
