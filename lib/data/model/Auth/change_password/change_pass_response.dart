/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjI2N2VlODZhMDI0ZjA2ZWEyNzgwMSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5NzQ2MjY5fQ.QMVlqP8lXIUjfgDUq-6JdqM_Dj8cAV4tlskzE50Dl8U"

class ChangePassResponse {
  String? message;
  String? token;

  ChangePassResponse({this.token, this.message});

  ChangePassResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }
}
