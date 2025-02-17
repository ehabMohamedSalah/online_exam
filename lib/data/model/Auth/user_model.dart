import '../../../domain/entity/Auth/auth_response/user_entity.dart';

/// _id : "67af710586a024f06ea26a31"
/// username : "ehabsalah"
/// firstName : "ehab"
/// lastName : "salah"
/// email : "ehabsalah@gmail.com"
/// phone : "01143668719"
/// role : "user"
/// isVerified : false
/// createdAt : "2025-02-14T16:36:21.143Z"

class UserModel {
  UserModel({
      this.id, 
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.role, 
      this.isVerified, 
      this.createdAt,});

  UserModel.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? createdAt;
  UserModel copyWith({  String? id,
  String? username,
  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? role,
  bool? isVerified,
  String? createdAt,
}) => UserModel(  id: id ?? this.id,
  username: username ?? this.username,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  role: role ?? this.role,
  isVerified: isVerified ?? this.isVerified,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    return map;
  }
  UserEntity toUserEntity() {
    return UserEntity(
      email: email,
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      role: role,
      username: username,
    );
  }
}