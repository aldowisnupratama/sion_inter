import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/biodata_dikti_service.dart';

part 'update_biodata_dikti_state.dart';

class UpdateBiodataDiktiCubit extends Cubit<UpdateBiodataDiktiState> {
  UpdateBiodataDiktiCubit() : super(UpdateBiodataDiktiInitial());

  void updateBiodataDikti(
      var nik, nama, ponsel, alamat, kelurahan, prov, kab, kec, ortu) async {
    try {
      emit(UpdateBiodataDiktiLoad());
      var updateBiodataDiktiResponse = await BiodataDiktiService()
          .updateBiodata(
              nik, nama, ponsel, alamat, kelurahan, prov, kab, kec, ortu);
      emit(UpdateBiodataDiktiSucces(
          updateBiodataDiktiSuccessModel: updateBiodataDiktiResponse));
    } catch (e) {
      emit(e is UpdateBiodataDiktiFailModel
          ? UpdateBiodataDiktiFail(errorMessage: e.error)
          : UpdateBiodataDiktiFail(errorMessage: [e.toString()]));
    }
  }
}
