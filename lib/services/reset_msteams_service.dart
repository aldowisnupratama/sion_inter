import 'package:shared_preferences/shared_preferences.dart';

import 'package:sion_inter/model/model.dart';

import 'package:sion_inter/shared/shared.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResetMsTeamsService {
  Future<ResetMSTeamsModel> resetPassword(String birthPlace) async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> data = {"tmpt_lahir": birthPlace};
    Uri _uri = Uri.https(baseApi, resetMsTeamsApi, data);
    var token = prefs.get("token");

    var resetMsTeamsResponse = await http.post(_uri, headers: {
      "Content-Type": "application/json; charset=UTF-8",
      "Charset": "utf-8",
      "Authorization": "$token"
    });
    var jsonBody = json.decode(resetMsTeamsResponse.body);
    if (resetMsTeamsResponse.body.contains("error")) {
      throw ResetMSTeamsFailModel.fromJson(jsonBody);
    } else {
      return ResetMSTeamsModel.fromJson(jsonBody);
    }
  }
}
