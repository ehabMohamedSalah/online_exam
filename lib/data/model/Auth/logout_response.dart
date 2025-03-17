import 'package:online_exam/domain/entity/Auth/auth_response/logout_entity.dart';

/// message : "success"

class LogoutResponse {
  final String? message;

  LogoutResponse({this.message});

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(message: json['message'] ?? '');
  }

  LogoutResponseEntity toLogoutResponseEntity() {
    return LogoutResponseEntity(message: message);
  }
}
