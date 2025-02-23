import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_screen_view_model_state.dart';

class ProfileScreenViewModelCubit extends Cubit<ProfileScreenViewModelState> {
  ProfileScreenViewModelCubit() : super(ProfileScreenViewModelInitial());
}
