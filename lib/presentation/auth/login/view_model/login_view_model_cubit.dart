import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/data/model/Auth/LoginResponse.dart';
import 'package:online_exam/domain/entity/Auth/login_response_entity/login_response.dart';
import '../../../../core/api/api_result.dart';
import '../../../../domain/usecase/login_usecase.dart';
part 'login_view_model_state.dart';

@injectable
class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  @factoryMethod
  LoginUseCase loginUseCase;

  LoginViewModelCubit(this.loginUseCase) : super(LoginViewModelInitial());

  //هو مساعد للوصول إلى الكيوبت (Cubit) بسهولة داخل الـ UI أو أي مكان آخر داخل التطبيق.
  static LoginViewModelCubit get(context) {
    return BlocProvider.of(context);
  }


  Future<void> login({required String email, required String password}) async {
    emit(Loginloading()); // بدء حالة التحميل
    print("🚀 Login Started...");

    var response = await loginUseCase.call(email: email, password: password);
    print("📩 API Response Received: $response");

    if (response is SuccessApiResult<LoginResponse>) {
      if (response.data?.code !=null) {
        print("🔴 Unauthorized (401): Invalid credentials");
        emit(LoginErorr(ErrorApiResult<LoginResponse>(
            Exception("Unauthorized: Invalid credentials"))));
      } else {
        print("✅ Login Success!");
        emit(LoginSuccess(response));
      }
    } else if (response is ErrorApiResult<LoginResponse>) {
      print("❌ Login Error: ${response.exception}");
      emit(LoginErorr(response)); // Passing the existing error response
    }
  }
}
