import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:http/http.dart' as http;

class FindService {
  Future<FindMahasiswaModel> searchForMhs(
    String q,
  ) async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> data = {"q": q};
    Uri _uri = Uri.https(baseApi, findMahasiswaApi, data);
    var token = prefs.get("token");

    try {
      var findMhsResponse = await http.post(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token",
      });

      if (findMhsResponse.body.contains("error")) {
        throw FindMahasiswaError.fromJson(json.decode(findMhsResponse.body));
      } else {
        return FindMahasiswaModel.fromJson(json.decode(findMhsResponse.body));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FindDosenModel> searchForLecturer(
    String q,
  ) async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> data = {"q": q};
    Uri _uri = Uri.https(baseApi, findDosenApi, data);
    var token = prefs.get("token");

    try {
      var findDosenResponse = await http.post(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token",
      });

      if (findDosenResponse.body.contains("error")) {
        throw FindDosenError.fromJson(json.decode(findDosenResponse.body));
      } else {
        return FindDosenModel.fromJson(json.decode(findDosenResponse.body));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
