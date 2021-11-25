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
