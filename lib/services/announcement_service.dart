import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/model/announcement_model.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:http/http.dart' as http;

class AnnouncementService {
  Future<AnnouncementModel> fetchAnnouncement() async {
    var prefs = await SharedPreferences.getInstance();
    Uri _uri = Uri.https(baseApi, pengumumanApi);
    var token = prefs.get("token");

    try {
      var announcementResponse = await http.get(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });

      return AnnouncementModel.fromJson(json.decode(announcementResponse.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
