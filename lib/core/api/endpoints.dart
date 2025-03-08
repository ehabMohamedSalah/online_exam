import 'package:online_exam/data/datasource_contract/exams_onsubject_datasource.dart';

class EndPoint {

  static const String signInEndpoint = "api/v1/auth/signin";
  static const String signUpEndpoint = "api/v1/auth/signup";
  static const String verifyEndpoint = "api/v1/auth/verifyResetCode";
  static const String resetPasswordEndpoint = "api/v1/auth/resetPassword";
  static const String ForgetPasswordEndpoints = "api/v1/auth/forgotPassword";
  static const String getAllExams = "https://exam.elevateegy.com/api/v1/subjects";

  static String ExamsOnSubjectEndpoint(String examID) {
    return "https://exam.elevateegy.com/api/v1/exams?subject=$examID";
  }

  static String QuestionsEndpoint(String examID) {
    return "api/v1/questions?exam=670070a830a3c3c1944a9c63";
  }
}
