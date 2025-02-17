import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'emailscreen_view_model_state.dart';

class EmailscreenViewModelCubit extends Cubit<EmailscreenViewModelState> {
  EmailscreenViewModelCubit() : super(EmailscreenViewModelInitial());
}
