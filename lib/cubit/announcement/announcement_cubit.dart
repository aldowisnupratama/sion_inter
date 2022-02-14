import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/announcement_model.dart';
import 'package:sion_inter/services/services.dart';

part 'announcement_state.dart';

class AnnouncementCubit extends Cubit<AnnouncementState> {
  AnnouncementCubit() : super(AnnouncementInitial());

  void fetchPengumuman() async {
    try {
      emit(AnnouncementLoading());
      var response = await AnnouncementService().fetchAnnouncement();
      print("response ni bos : ${response.pengumuman}");
      print("message == ${response.message}");
      print("result == ${response.result}");
      if (response.pengumuman!.isNotEmpty) {
        emit(AnnouncementValid(response.pengumuman));
      } else {
        emit(AnnouncementInvalid(response.result));
      }
    } catch (e) {
      emit(AnnouncementInvalid(e.toString()));
    }
  }
}
