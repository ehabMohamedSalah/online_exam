import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/profile_tab/change_password_entry/change_passowrd_response_entity.dart';
import 'package:online_exam/domain/usecase/profile_usecase/change_password_usecase.dart';

part 'new_password_view_model_state.dart';
@injectable

class NewPasswordViewModelCubit extends Cubit<NewPasswordViewModelState> {
  ChangePasswordUsecase changePasswordUsecase;

  @factoryMethod
  NewPasswordViewModelCubit(this.changePasswordUsecase)
      : super(NewPasswordViewModelInitial());

  static NewPasswordViewModelCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> ChangePassword(
      {required String token, required String message}) async {
    emit(NewPasswordloading());
    print("🚀 Forget Password Request Started...");

    var response =
        await changePasswordUsecase.call(token: token, message: message);

    if (response is SuccessApiResult<ChangePassowrdResponseEntity>) {
      print("✅ Success: ${response.data?.message}");
      emit(NewPasswordSuccess(response));
    } else if (response is ErrorApiResult<ChangePassowrdResponseEntity>) {
      print("❌ Error: ${response.exception}");
      emit(NewPasswordErorr(response));
    }
  }
}
