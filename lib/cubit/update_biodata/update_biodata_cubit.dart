import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/services.dart';

part 'update_biodata_state.dart';

class UpdateBiodataCubit extends Cubit<UpdateBiodataState> {
  UpdateBiodataCubit() : super(UpdateBiodataInitial());

  void updateBiodata(String email, String nisn, String address,
      String phoneNumber, String faceboook, String twitter) async {
    try {
      emit(UpdateBiodataLoad());
      var updateBiodataResponse = await BiodataService()
          .updateBiodata(email, nisn, address, phoneNumber, faceboook, twitter);
      if (updateBiodataResponse.result == "Data Berhasil Diperbaharui.") {
        emit(UpdateBiodataValid(updateBiodataModel: updateBiodataResponse));
      } else {
        emit(
            UpdateBiodatalInvalid(errorMessage: updateBiodataResponse.message));
      }
    } catch (e) {
      emit(UpdateBiodatalInvalid(errorMessage: e.toString()));
    }
  }
}
