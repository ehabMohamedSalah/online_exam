/// message : "success"
/// info : "OTP sent to your email"
/// code : 404

class ForgetPasswordResponse {
  String? message;
  String? info;
  int? code;

  ForgetPasswordResponse({
    this.message,
    this.info,
    this.code,
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    map['code'] = code;
    return map;
  }
}
