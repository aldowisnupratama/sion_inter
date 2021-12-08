import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/services.dart';

part 'final_test_state.dart';

class FinalTestCubit extends Cubit<FinalTestState> {
  FinalTestCubit() : super(FinalTestInitial());

  void fetchFinalTest() async {
    try {
      emit(FinalTestLoading());
      var finalTestModel = await FinalTestService().fetchFinalTest();
      if (finalTestModel.message == null) {
        emit(FinalTestSuccess(listOfUas: finalTestModel.uas));
      } else {
        emit(FinalTestFailed(errorMessage: finalTestModel.message.toString()));
      }
    } catch (e) {
      emit(FinalTestFailed(errorMessage: e.toString()));
    }
  }
}
