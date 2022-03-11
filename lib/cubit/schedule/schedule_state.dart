part of 'schedule_cubit.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoad extends ScheduleState {}

class ScheduleSuccess extends ScheduleState {
  final List<JadwalKuliah> listOfJadwalKuliah;

  ScheduleSuccess({required this.listOfJadwalKuliah});

  @override
  List<Object> get props => [listOfJadwalKuliah];
  @override
  String toString() {
    return "ScheduleSucess { jadwal_kuliah : ${listOfJadwalKuliah.length}";
  }
}

class ScheduleFail extends ScheduleState {
  final String errorMessage;

  ScheduleFail({required this.errorMessage});

  @override
  String toString() {
    return "ScheduleFail : $errorMessage";
  }
}
