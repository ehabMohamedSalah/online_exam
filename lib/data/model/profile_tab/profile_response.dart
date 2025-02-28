import 'package:online_exam/domain/entity/profile_tab/profile_entry/profile_response_entity.dart';

import 'user_profile.dart';

/// message : "success"
/// user : {"_id":"67b267ee86a024f06ea27801","username":"mariam11233","firstName":"Mariam","lastName":"Adel","email":"mariamshahir2000@gmail.com","phone":"01554195222","role":"user","isVerified":false,"createdAt":"2025-02-16T22:34:22.373Z","passwordResetCode":"88615582dd369f67ae37419e1121a636c3c992aa0e1085ba0462ae6768746c60","passwordResetExpires":"2025-02-16T22:47:18.125Z","resetCodeVerified":true,"passwordChangedAt":"2025-02-25T12:14:56.320Z"}

class ProfileResponse {
  final String? message;
  final UserProfile? user;
  final int? code;

  ProfileResponse({this.message, this.user, this.code});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      message: json['message'],
      code: json['code'],
      user: json['user'] != null ? UserProfile.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'user': user?.toJson(),
    };
  }

  ProfileResponseEntity toProfileResponseEntity() {
    return ProfileResponseEntity(
      message: message,
      code: code,
      user: user?.toUserProfileEntity(),
    );
  }
}
