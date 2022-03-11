import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/schedule_service.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  void fetchSchedule() async {
    emit(ScheduleLoad());
    try {
      var response = await ScheduleService().fetchSchedule();
      emit(ScheduleSuccess(listOfJadwalKuliah: response.jadwalKuliah));
    } catch (e) {
      emit(e is ScheduleErrorModel
          ? ScheduleFail(errorMessage: e.message)
          : ScheduleFail(errorMessage: e.toString()));
    }
  }
}
