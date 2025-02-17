/// oldPassword : "Bl77@2222"
/// password : "Elevate@123"
/// rePassword : "Elevate@123"

class ChangePasswordResponse {
  String? oldPassword;
  String? password;
  String? rePassword;
  String? message;
  int? code;
  String? token;

  ChangePasswordResponse({this.rePassword, this.password, this.oldPassword,this.code,this.message,this.token});

  ChangePasswordResponse.fromJson(dynamic json) {
    oldPassword = json['oldPassword'];
    password = json['password'];
    rePassword = json['rePassword'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['password'] = password;
    map['rePassword'] = rePassword;
    return map;
  }
}
