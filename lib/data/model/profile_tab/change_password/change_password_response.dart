import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjI2N2VlODZhMDI0ZjA2ZWEyNzgwMSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQwNDg1Njk2fQ.h-tV2ISc65_D2b2ErjlH5Uh5s2LgB9QW4Q1XoUcxS9o"

class ChangePasswordResponse {
  String? message;
  String? token;

  ChangePasswordResponse({this.token, this.message});

  ChangePasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

  ChangePassowrdResponseEntity toChangePasswordResponseEntity() {
    return ChangePassowrdResponseEntity(
      message: message,
      token: token,
    );
  }
}
