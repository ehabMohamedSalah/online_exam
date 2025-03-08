import 'package:online_exam/domain/entity/profile_tab/profile_entry/user_profile_entity.dart';

/// _id : "67b267ee86a024f06ea27801"
/// username : "mariam11233"
/// firstName : "Mariam"
/// lastName : "Adel"
/// email : "mariamshahir2000@gmail.com"
/// phone : "01554195222"
/// role : "user"
/// isVerified : false
/// createdAt : "2025-02-16T22:34:22.373Z"
/// passwordResetCode : "88615582dd369f67ae37419e1121a636c3c992aa0e1085ba0462ae6768746c60"
/// passwordResetExpires : "2025-02-16T22:47:18.125Z"
/// resetCodeVerified : true
/// passwordChangedAt : "2025-02-25T12:14:56.320Z"

class UserProfile {
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;
  final String? passwordResetCode;
  final String? passwordResetExpires;
  final bool? resetCodeVerified;
  final String? passwordChangedAt;

  UserProfile({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.passwordChangedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      isVerified: json['isVerified'],
      createdAt: json['createdAt'],
      passwordResetCode: json['passwordResetCode'],
      passwordResetExpires: json['passwordResetExpires'],
      resetCodeVerified: json['resetCodeVerified'],
      passwordChangedAt: json['passwordChangedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'role': role,
      'isVerified': isVerified,
      'createdAt': createdAt,
      'passwordResetCode': passwordResetCode,
      'passwordResetExpires': passwordResetExpires,
      'resetCodeVerified': resetCodeVerified,
      'passwordChangedAt': passwordChangedAt,
    };
  }

  UserProfileEntity toUserProfileEntity() {
    return UserProfileEntity(
      email: email,
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      role: role,
      username: username,
      passwordResetCode: passwordResetCode,
    );
  }

  factory UserProfile.fromEntity(UserProfileEntity entity) {
    return UserProfile(
      username: entity.username,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phone: entity.phone,
      passwordResetCode: entity.passwordResetCode,
    );
  }

}
