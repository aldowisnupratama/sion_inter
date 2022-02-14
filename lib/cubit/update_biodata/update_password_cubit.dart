import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/services.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());

  void updatePassword(String password1, String password2) async {
    try {
      emit(UpdatePasswordLoad());
      var updateBiodataresponse =
          await AuthService().updatePassword(password1, password2);
      if (updateBiodataresponse.result ==
          "Password Telah Diganti, Silahkan Re-Login...") {
        emit(UpdatePasswordValid(updateBiodataresponse));
      } else {
        emit(UpdatePasswordInvalid(updateBiodataresponse.result.toString()));
      }
    } catch (e) {
      emit(UpdatePasswordInvalid(e.toString()));
    }
  }
}
