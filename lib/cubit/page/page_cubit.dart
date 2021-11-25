import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(AnnouncementPageState(title: "Announcement"));

  void changePage(PageState state) {
    emit(state);
  }
}
