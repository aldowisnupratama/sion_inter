import 'package:bloc/bloc.dart';

class SelectedDayCubit extends Cubit<List<String>> {
  SelectedDayCubit() : super(["Monday"]);

  void selectDay(String id) {
    if (!isSelected(id)) {
      state.clear();
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(List.from(state));
  }

  bool isSelected(String id) {
    if (state.indexOf(id) == -1) {
      return false;
    }
    return true;
  }
}
