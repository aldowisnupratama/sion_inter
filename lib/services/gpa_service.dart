import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:sion_inter/shared/shared.dart';

class GPAService {
  Future<GPAModel> fetchGPA() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    Uri uri = Uri.https(baseApi, gpaApi);

    try {
      var gpaResponse = await http.get(uri, headers: {
        "Content-Type": "applicaiton/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      return GPAModel.fromJson(json.decode(gpaResponse.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
