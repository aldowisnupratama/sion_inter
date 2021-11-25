import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/services/services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginPost(String username, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      emit(LoginLoading());
      final loginResponse = await LoginService().fetchLogin(username, password);

      if (loginResponse.token != null) {
        pref.setString(
            "token", "${loginResponse.tokenType} ${loginResponse.token}");
        emit(LoginValid());
      } else {
        emit(LoginInvalid(errorMessage: loginResponse.message.toString()));
      }
    } catch (e) {
      print(e.toString());
      emit(LoginInvalid(errorMessage: e.toString()));
    }
  }
}
