import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:http/http.dart' as http;

class BiodataService {
  Future<BiodataModel> fetchBiodata() async {
    var prefs = await SharedPreferences.getInstance();
    Uri _uri = Uri.https(baseApi, biodataApi);
    var token = prefs.get("token");

    try {
      var _biodataResponse = await http.get(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      return BiodataModel.fromJson(json.decode(_biodataResponse.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
