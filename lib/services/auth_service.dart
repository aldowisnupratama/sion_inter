import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<LoginModel> fetchLogin(String username, String password) async {
    Map<String, String> data = {"username": username, "password": password};
    Uri _uri = Uri.https(baseApi, loginApi, data);

    try {
      final response = await http.post(_uri);
      return LoginModel.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UpdatePasswordModel> updatePassword(
      String password1, String password2) async {
    Map<String, String> data = {"password1": password1, "password2": password2};
    Uri uri = Uri.https(baseApi, updatePasswordApi, data);
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    try {
      var response = await http.post(uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      return UpdatePasswordModel.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
