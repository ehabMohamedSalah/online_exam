/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjI2N2VlODZhMDI0ZjA2ZWEyNzgwMSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQwNDg1Njk2fQ.h-tV2ISc65_D2b2ErjlH5Uh5s2LgB9QW4Q1XoUcxS9o"

class ChangePassowrdResponseEntity {
  String? message;
  String? token;

  ChangePassowrdResponseEntity({this.token, this.message});
}
