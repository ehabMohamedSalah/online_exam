import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verifiy_view_model_state.dart';

class VerifiyViewModelCubit extends Cubit<VerifiyViewModelState> {
  VerifiyViewModelCubit() : super(VerifiyViewModelInitial());
}
