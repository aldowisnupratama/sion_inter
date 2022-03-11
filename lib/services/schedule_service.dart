import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';

class ScheduleService {
  Future<ScheduleModel> fetchSchedule() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    Uri uri = Uri.https(baseApi, scheduleApi);
    try {
      var response = await http.get(uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      if (response.body.contains("jadwal_kuliah")) {
        return ScheduleModel.fromJson(json.decode(response.body));
      } else {
        throw ScheduleErrorModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
