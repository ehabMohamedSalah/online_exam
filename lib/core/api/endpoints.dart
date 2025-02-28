class EndPoint {
  static const String signInEndpoint = "api/v1/auth/signin";
  static const String signUpEndpoint = "api/v1/auth/signup";
  static const String verifyEndpoint = "api/v1/auth/verifyResetCode";
  static const String resetPasswordEndpoint = "api/v1/auth/resetPassword";
  static const String ForgetPasswordEndpoints = "api/v1/auth/forgotPassword";
  static const String getAllExams =
      "https://exam.elevateegy.com/api/v1/subjects";

  static String ExamsOnSubjectEndpoint(String subjectID) {
    return "https://exam.elevateegy.com/api/v1/exams?subject=$subjectID";
  }

  static const String changePasswordEndpoint = "api/v1/auth/changePassword";
  static const String profileInfoEndpoint = "api/v1/auth/profileData";
  static const String editProfileEndpoint = "api/v1/auth/editProfile";
}
