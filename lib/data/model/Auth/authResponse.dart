import 'package:online_exam/domain/entity/Auth/auth_response.dart';

import 'user_model.dart';

/// message : "success"
/// code : 200
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YWY3MTA1ODZhMDI0ZjA2ZWEyNmEzMSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5NTUxMjc3fQ.CUG4hwcVeqt7vO9nhR0T5Vag8b2RmdQWYzTi8SLiOOY"
/// user : {"_id":"67af710586a024f06ea26a31","username":"ehabsalah","firstName":"ehab","lastName":"salah","email":"ehabsalah@gmail.com","phone":"01143668719","role":"user","isVerified":false,"createdAt":"2025-02-14T16:36:21.143Z"}

class AuthResponseModel {
  AuthResponseModel({
      this.message, 
      this.code, 
      this.token, 
      this.user,});

  AuthResponseModel.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
  String? message;
  int? code;
  String? token;
  UserModel? user;
AuthResponseModel copyWith({  String? message,
  int? code,
  String? token,
  UserModel? user,
}) => AuthResponseModel(  message: message ?? this.message,
  code: code ?? this.code,
  token: token ?? this.token,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

  AuthResponseEntity toLoginResponseEntity(){
    return AuthResponseEntity(
      message: message,
      user: user?.toUserEntity(),
      token: token,
      code: code,
    );
  }

}