import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/biodata_service.dart';

part 'biodata_state.dart';

class BiodataCubit extends Cubit<BiodataState> {
  BiodataCubit() : super(BiodataInitial());

  Future<void> biodataGet() async {
    try {
      final _biodataResponse = await BiodataService().fetchBiodata();
      if (_biodataResponse.message == null) {
        print("ini aldo ganteng : ${_biodataResponse.biodata?.nama}");
        emit(BiodataValid(biodataModel: _biodataResponse));
      } else {
        emit(BiodataInvalid(errorMessage: _biodataResponse.message.toString()));
      }
    } catch (e) {
      emit(BiodataInvalid(errorMessage: e.toString()));
    }
  }
}
