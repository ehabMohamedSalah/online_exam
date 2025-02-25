import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';

abstract class ProfileRepo{
    Future<ApiResult<ChangePassowrdResponseEntity>> ChangePassword({required String message,required String token});

}