import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'profile_screen_view_model_state.dart';
@injectable

class ProfileScreenViewModelCubit extends Cubit<ProfileScreenViewModelState> {
  ProfileScreenViewModelCubit() : super(ProfileScreenViewModelInitial());
}
