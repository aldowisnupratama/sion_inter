import 'dart:convert';

import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:http/http.dart' as http;

class LoginService {
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
}
