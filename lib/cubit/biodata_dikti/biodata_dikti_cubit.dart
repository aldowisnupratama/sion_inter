import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/biodata_dikti_service.dart';

part 'biodata_dikti_state.dart';

class BiodataDiktiCubit extends Cubit<BiodataDiktiState> {
  BiodataDiktiCubit() : super(BiodataDiktiLoad());

  void fetchBiodataDikti() async {
    try {
      var biodataDiktiModel = await BiodataDiktiService().fetchBiodataDikti();
      emit(BiodataDiktiSuccess(biodataDikti: biodataDiktiModel.biodataDikti));
    } catch (e) {
      emit(BiodataDiktiFail(errorMessage: e.toString()));
    }
  }
}
