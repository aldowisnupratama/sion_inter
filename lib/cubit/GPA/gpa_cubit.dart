import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';

import 'package:sion_inter/services/gpa_service.dart';

part 'gpa_state.dart';

class GpaCubit extends Cubit<GpaState> {
  GpaCubit() : super(GpaInitial());

  void fetchGPA() async {
    try {
      emit(GpaLoading());
      var gpaModel = await GPAService().fetchGPA();
      if (gpaModel.message == null) {
        emit(GpaSuccess(gpa: gpaModel.ip!));
      } else {
        emit(GpaFailed(errorMessage: gpaModel.message.toString()));
      }
    } catch (e) {
      emit(GpaFailed(errorMessage: e.toString()));
    }
  }
}
