import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain/usecase/auth_usecase/signup_usecase.dart';

import '../../../../domain/entity/Auth/auth_response.dart';
part 'signup_view_model_state.dart';

@injectable
class SignupViewModelCubit extends Cubit<SignupViewModelState> {
  @factoryMethod
  SignupUsecase signupUsecase;
  SignupViewModelCubit(this.signupUsecase) : super(SignupViewModelInitial());

  static SignupViewModelCubit get(context){
    return BlocProvider.of(context);
  }
  Signup({
    required  String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async{
    emit(Signuploading());
    var response= await signupUsecase.call(username: username, firstName: firstName, lastName: lastName, email: email, password: password, rePassword: rePassword, phone: phone);
    response.fold(
          (AuthEntity) => emit(SignupSuccess(AuthEntity)),
          (err) => emit(SignupErorr(err)),
    );
  }

}
