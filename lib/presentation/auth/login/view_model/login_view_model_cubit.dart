import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain/entity/Auth/login_response_entity/login_response.dart';
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
  login({required String email,required String password})async{
    emit(Loginloading());
   var response= await loginUseCase.call(email:email,password:password);
   response.fold(
           (AuthEntity) => emit(LoginSuccess(AuthEntity)), 
           (err) => emit(LoginErorr(err)),
   );
  }


}
