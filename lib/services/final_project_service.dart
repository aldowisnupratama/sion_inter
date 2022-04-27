import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/model/final_project_topic_model.dart';
import 'package:sion_inter/model/search_final_project_error_model.dart';
import 'package:sion_inter/model/search_final_project_model.dart';
import 'package:http/http.dart' as http;
import '../shared/shared.dart';

class FinalProjectService {
  Future<SearchFinalProjectModel> searchFinalProjects(String q) async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> data = {"q": q};
    Uri _uri = Uri.https(baseApi, searchFinalProjectApi, data);
    var token = prefs.get("token");
    try {
      var searchFinalProjectResponse = await http.post(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token",
      });
      if (searchFinalProjectResponse.body.contains("error")) {
        throw SearchFinalProjectErrorModel.fromJson(
            json.decode(searchFinalProjectResponse.body));
      } else {
        return SearchFinalProjectModel.fromJson(
            json.decode(searchFinalProjectResponse.body));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FinalProjectTopicsModel> fetchFinalProjects() async {
    var prefs = await SharedPreferences.getInstance();

    Uri _uri = Uri.https(baseApi, finalProjectTopics);
    var token = prefs.get("token");
    try {
      var searchFinalProjectResponse = await http.get(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token",
      });

      return FinalProjectTopicsModel.fromJson(
          json.decode(searchFinalProjectResponse.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
