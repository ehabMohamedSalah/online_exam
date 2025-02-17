/// message : "success"
/// info : "OTP sent to your email"
/// code : 404

class ForgetPasswordResponseEntity {
  String? message;
  String? info;
  int? code;

  ForgetPasswordResponseEntity({
    this.message,
    this.info,
    this.code,
  });
}
