import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/services.dart';

part 'resetmsteams_state.dart';

class ResetMsTeamsCubit extends Cubit<ResetmsteamsState> {
  ResetMsTeamsCubit() : super(ResetmsteamsInitial());

  void resetPassword(String birthPlace) async {
    emit(ResetMsTeamsLoad());
    try {
      var resetResponse = await ResetMsTeamsService().resetPassword(birthPlace);
      emit(ResetMsTeamsSuccess(resetMSTeamsModel: resetResponse));
    } catch (error) {
      emit(error is ResetMSTeamsFailModel
          ? ResetMsTeamsFail(resetMsTeamsFail: error)
          : ResetMsTeamsFail(
              resetMsTeamsFail: ResetMSTeamsFailModel(
                  result: "Something went error", message: "fail")));
    }
  }
}
