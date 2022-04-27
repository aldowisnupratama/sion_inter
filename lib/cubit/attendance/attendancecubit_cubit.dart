import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/model.dart';
import '../../services/services.dart';

part 'attendancecubit_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendancecubitInitial());

  void fetchAttendance() async {
    emit(AttendanceLoad());
    try {
      var attendanceRespose = await AttendanceService().fetchAttendance();
      emit(AttendanceSuccess(absensiModel: attendanceRespose));
    } catch (e) {
      emit(e is AttendanceFailModel
          ? AttendanceFail(attendanceFailModel: e)
          : AttendanceFail(
              attendanceFailModel: AttendanceFailModel(
                  message: "fail", result: "Something went wrong")));
    }
  }
}
