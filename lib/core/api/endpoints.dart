import 'package:online_exam/data/datasource_contract/exams_onsubject_datasource.dart';

class EndPoint{

  static const String signInEndpoint="api/v1/auth/signin";
  static const String signUpEndpoint="api/v1/auth/signup";
  static const String verifyEndpoint = "api/v1/auth/verifyResetCode";
  static const String resetPasswordEndpoint = "api/v1/auth/resetPassword";
  static const String ForgetPasswordEndpoints="api/v1/auth/forgotPassword";
  static const String getAllExams="api/v1/subjects";
  static String ExamsOnSubjectEndpoint(String subjectID) {
    return "api/v1/exams?subject=$subjectID";
  }
  static String QuestionsEndpoint(String examID) {
    return "api/v1/questions?exam=$examID";
  }
  static const String changePasswordEndpoint = "api/v1/auth/changePassword";
  static const String profileInfoEndpoint = "api/v1/auth/profileData";
  static const String editProfileEndpoint = "api/v1/auth/editProfile";
  static const String checkQuestionEndpoint = "api/v1/questions/check";



 }
