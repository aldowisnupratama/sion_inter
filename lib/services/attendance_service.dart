import 'package:shared_preferences/shared_preferences.dart';

import 'package:sion_inter/shared/shared.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/model.dart';

class AttendanceService {
  Future<AbsensiModel> fetchAttendance() async {
    var prefs = await SharedPreferences.getInstance();
    Uri _uri = Uri.https(baseApi, attendanceApi);
    var token = prefs.get("token");

    var attendanceResponse = await http.get(_uri, headers: {
      "Content-Type": "application/json; charset=UTF-8",
      "Charset": "utf-8",
      "Authorization": "$token"
    });
    if (attendanceResponse.statusCode == 401) {
      throw AttendanceFailModel.fromJson(json.decode(attendanceResponse.body));
    }
    return AbsensiModel.fromJson(json.decode(attendanceResponse.body));
  }
}
