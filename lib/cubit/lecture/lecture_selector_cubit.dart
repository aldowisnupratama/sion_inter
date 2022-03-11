import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lecture_selector_state.dart';

class LectureSelectorCubit extends Cubit<LectureSelectorState> {
  LectureSelectorCubit() : super(MondayLecture());

  void changeLectureList(LectureSelectorState state) {
    emit(state);
  }
}
