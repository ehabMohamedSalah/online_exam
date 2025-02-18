import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain/entity/Auth/reset_pass_response_entity/reset_passowrd_response_entity.dart';

import '../../../../../core/api/api_result.dart';
import '../../../../../domain/usecase/auth_usecase/reset_password.dart';

part 'reset_password_view_model_state.dart';

@injectable
class ResetPasswordViewModelCubit extends Cubit<ResetPasswordViewModelState> {
  ResetPasswordUsecase resetPasswordUsecase;
  @factoryMethod
  ResetPasswordViewModelCubit(this.resetPasswordUsecase) : super(ResetPasswordViewModelInitial());


  static ResetPasswordViewModelCubit get(context) {
    return BlocProvider.of(context);
  }


  Future<void> ResetPassword({required String email,required String NewPassword}) async {
    emit(ResetPasswordloading());
    print("🚀 Forget Password Request Started...");

    var response = await resetPasswordUsecase.call(email: email, NewPassword: NewPassword);

    if (response is SuccessApiResult<ResetPasswordResponseEntity>) {
      print("✅ Success: ${response.data?.message}");
      emit(ResetPasswordSuccess(response));
    } else if (response is ErrorApiResult<ResetPasswordResponseEntity>) {
      print("❌ Error: ${response.exception}");
      emit(ResetPasswordErorr(response));
    }
  }
}
