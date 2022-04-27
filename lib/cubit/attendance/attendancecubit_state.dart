part of 'attendancecubit_cubit.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendancecubitInitial extends AttendanceState {}

class AttendanceLoad extends AttendanceState {}

class AttendanceFail extends AttendanceState {
  final AttendanceFailModel attendanceFailModel;

  AttendanceFail({required this.attendanceFailModel});
}

class AttendanceSuccess extends AttendanceState {
  final AbsensiModel absensiModel;

  AttendanceSuccess({required this.absensiModel});
}
