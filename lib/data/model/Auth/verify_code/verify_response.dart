/// status : "Success"

class VerifyResponse {
  String? status;

  VerifyResponse({this.status});

  VerifyResponse.fromJson(dynamic json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
