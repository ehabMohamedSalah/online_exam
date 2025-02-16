import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';

/// resetCode : "429392"

class VerifyResponse {
  String? message;
  int? code;
  String? token;
  String? resetCode;

  VerifyResponse({this.resetCode, this.token, this.message, this.code});

  VerifyResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    token = json['token'];
    resetCode = json['resetCode'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['token'] = token;
    map['resetCode'] = resetCode;
    return map;
  }

  VerifyResponseEntity toVerifyResponseEntity() {
    return VerifyResponseEntity(
      message: message,
      code: code,
      resetCode: resetCode,
    );
  }
}
