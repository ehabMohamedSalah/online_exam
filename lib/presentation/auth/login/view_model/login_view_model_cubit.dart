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
  static LoginViewModelCubit get(context){
    return BlocProvider.of(context);
  }


  Future<void> login({required String email,required String password})async{

   var response= await loginUseCase.call(email:email,password:password);
    switch(response){
      case SuccessApiResult<LoginResponse>():
        emit(
          LoginSuccess(
            response,
          ),
        );
      case ErrorApiResult<LoginResponse>():
        emit(
          LoginErorr(
            ErrorApiResult(response.exception),
          ),
        );


}}}

