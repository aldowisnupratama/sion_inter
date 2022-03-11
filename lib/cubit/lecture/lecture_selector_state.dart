part of 'lecture_selector_cubit.dart';

abstract class LectureSelectorState extends Equatable {
  const LectureSelectorState();

  @override
  List<Object> get props => [];
}

class MondayLecture extends LectureSelectorState {}

class TuesdayLecture extends LectureSelectorState {}

class WednesdayLecture extends LectureSelectorState {}

class ThursdayLecture extends LectureSelectorState {}

class FridayLecture extends LectureSelectorState {}

class SaturdayLecture extends LectureSelectorState {}
