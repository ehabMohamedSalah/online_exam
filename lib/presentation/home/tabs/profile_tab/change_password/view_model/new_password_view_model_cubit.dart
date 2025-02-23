import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_password_view_model_state.dart';

class NewPasswordViewModelCubit extends Cubit<NewPasswordViewModelState> {
  NewPasswordViewModelCubit() : super(NewPasswordViewModelInitial());
}
