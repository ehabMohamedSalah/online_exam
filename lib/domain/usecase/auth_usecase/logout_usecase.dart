import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/data/datasource_contract/auth_datasource.dart';
import 'package:online_exam/data/model/Auth/Logout_response.dart';

@injectable
class LogoutUseCase {
  AuthDatasource logoutdata;

  LogoutUseCase(this.logoutdata);

  Future<ApiResult<LogoutResponse>> call() async {
    return await logoutdata.Logout();
  }
}
