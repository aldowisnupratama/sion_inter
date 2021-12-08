import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'announcement_state.dart';

class AnnouncementCubit extends Cubit<AnnouncementState> {
  AnnouncementCubit() : super(AnnouncementInitial());
}
