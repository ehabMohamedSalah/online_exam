import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'confirmpass_view_model_state.dart';

class ConfirmpassViewModelCubit extends Cubit<ConfirmpassViewModelState> {
  ConfirmpassViewModelCubit() : super(ConfirmpassViewModelInitial());
}
