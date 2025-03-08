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

class UserProfileEntity {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  String? passwordResetCode;

  UserProfileEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.username,
    this.role,
    this.passwordResetCode,
  });
}
