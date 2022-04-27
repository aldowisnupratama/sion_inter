part of 'page_cubit.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class AnnouncementPageState extends PageState {
  final String title;
  AnnouncementPageState({required this.title});

  @override
  List<Object> get props => [title];
}

class SchedulePageState extends PageState {
  final String title;
  SchedulePageState({required this.title});

  @override
  List<Object> get props => [title];
}

class GPAPageState extends PageState {
  final String title;

  GPAPageState({required this.title});
  @override
  List<Object> get props => [title];
}

class GuardianshipPageState extends PageState {
  final String title;

  GuardianshipPageState({required this.title});
}

class FinalTestPageState extends PageState {
  final String title;

  FinalTestPageState({required this.title});
}

class FinalProjectPageState extends PageState {
  final String title;
  FinalProjectPageState({required this.title});
}
