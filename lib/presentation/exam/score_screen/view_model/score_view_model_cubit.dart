import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'score_view_model_state.dart';

class ScoreViewModelCubit extends Cubit<ScoreViewModelState> {
  ScoreViewModelCubit() : super(ScoreViewModelInitial());
}
