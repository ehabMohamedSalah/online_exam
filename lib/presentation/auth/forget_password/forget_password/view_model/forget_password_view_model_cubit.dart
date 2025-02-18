import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain/entity/Auth/foreget_pass_entity/ForgetPassEntity.dart';

import '../../../../../core/api/api_result.dart';
import '../../../../../data/model/Auth/forget_passowrd/ForgetPasswordResponse.dart';
import '../../../../../domain/usecase/auth_usecase/forget_password_usecase.dart';

part 'forget_password_view_model_state.dart';

@injectable
class ForgetPasswordViewModelCubit extends Cubit<ForgetPasswordViewModelState> {
  ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordViewModelCubit(this.forgetPasswordUsecase) : super(ForgetPasswordInitial());

  static ForgetPasswordViewModelCubit get(context) {
    return BlocProvider.of(context);
  }


  Future<void> ForgetPassword({required String email}) async {
    emit(ForgetPasswordloading());
    print("🚀 Forget Password Request Started...");

    var response = await forgetPasswordUsecase.call(email: email);

    if (response is SuccessApiResult<ForgetPasswordEntity>) {
      print("✅ Success: ${response.data?.info}");
      emit(ForgetPasswordSuccess(response));
    } else if (response is ErrorApiResult<ForgetPasswordEntity>) {
      print("❌ Error: ${response.exception}");
      emit(ForgetPasswordErorr(response));
    }
  }
}