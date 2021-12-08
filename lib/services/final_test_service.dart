import 'package:sion_inter/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/shared/shared.dart';

class FinalTestService {
  Future<FinalTestModel> fetchFinalTest() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.get("token");
    Uri uri = Uri.https(baseApi, finalTestApi);

    try {
      var finalTestResponse = await http.get(uri, headers: {
        "Content-Type": "applicaiton/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      return FinalTestModel.fromJson(json.decode(finalTestResponse.body));
    } catch (e) {
      throw (e);
    }
  }
}
