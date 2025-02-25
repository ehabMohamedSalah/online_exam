import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';

/// status : "Success"
/// message : "Reset code is invalid or has expired"
/// code : 400

class VerifyResponseModel {
  VerifyResponseModel({
      this.status, 
      this.message, 
      this.code,});

  VerifyResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }
  String? status;
  String? message;
  int? code;
VerifyResponseModel copyWith({  String? status,
  String? message,
  int? code,
}) => VerifyResponseModel(  status: status ?? this.status,
  message: message ?? this.message,
  code: code ?? this.code,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['code'] = code;
    return map;
  }

  VerifyResponseEntity toVerifyResponseEntity(){
    return VerifyResponseEntity(
      message: message,
      code:code,
      status: status,
    );
  }

}