import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/local_storage/exam_result_storage.dart';
import '../../../../domain/entity/Auth/auth_response/auth_response.dart';
import '../../../../domain/usecase/auth_usecase/login_usecase.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  @factoryMethod
  LoginUseCase loginUseCase;
  LoginViewModelCubit(this.loginUseCase) : super(LoginViewModelInitial());

  // هو مساعد للوصول إلى الكيوبت بسهولة داخل الـ UI أو أي مكان آخر داخل التطبيق.
  static LoginViewModelCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> login({required String email, required String password}) async {
    emit(Loginloading());
    try {
      var response = await loginUseCase.call(email: email, password: password);
      response.fold(
            (authEntity) async {
          // ✅ استخراج التوكن وحفظه
          final token = authEntity.token; // تأكد من أن `token` موجود في `AuthEntity`
          if (token != null) {
            await ExamResultsStorage.saveUserToken(token);
            print("✅ Token Saved: $token");
          }
          emit(LoginSuccess(authEntity));
        },
            (err) {
          emit(LoginErorr(err));
        },
      );
    } catch (e) {
      emit(LoginErorr("Unexpected error occurred: $e"));
    }
  }
}
