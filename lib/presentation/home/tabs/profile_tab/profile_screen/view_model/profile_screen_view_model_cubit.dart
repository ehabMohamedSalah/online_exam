import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/profile_response_entity.dart';
import 'package:online_exam/domain/usecase/profile_usecase/profile_info_usecase.dart';

part 'profile_screen_view_model_state.dart';
@injectable

class ProfileScreenViewModelCubit extends Cubit<ProfileScreenViewModelState> {
  ProfileInfoUsecase getProfileInfoUsecase;

  @factoryMethod
  ProfileScreenViewModelCubit(this.getProfileInfoUsecase)
      : super(ProfileScreenViewModelInitial());

  static ProfileScreenViewModelCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> getAllExams({required String userId}) async {
    emit(ProfileScreenViewModelLoadingState());

    var response = await getProfileInfoUsecase.call(id: userId);

    if (response is SuccessApiResult<ProfileResponseEntity>) {
      emit(ProfileScreenViewModelSuccessState(response));
    } else if (response is ErrorApiResult<ProfileResponseEntity>) {
      emit(ProfileScreenViewModelErrorState(response));
    }
  }
}
