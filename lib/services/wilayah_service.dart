import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/model/get_wilayah_model.dart';

import '../shared/shared.dart';

class WilayahService {
  Future<List<Wilayah>> getProv() async {
    var prefs = await SharedPreferences.getInstance();
    Uri _uri = Uri.https(baseApi, getProvApi);
    var token = prefs.get("token");
    try {
      var provResponse = await http.get(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      if (provResponse.statusCode != 200) {
        throw Exception("Status code != 200");
      }
      List<Wilayah> provs =
          GetProvModel.fromJson(json.decode(provResponse.body)).wilayah;
      return provs;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<List<Wilayah>> getKabs(String prov) async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> data = {"kode": prov};
    Uri _uri = Uri.https(baseApi, getKabApi, data);
    var token = prefs.get("token");
    try {
      var provResponse = await http.post(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      if (provResponse.statusCode != 200) {
        throw Exception("${provResponse.body}");
      }
      List<Wilayah> kabs =
          GetKabModel.fromJson(json.decode(provResponse.body)).wilayah;
      return kabs;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<List<Wilayah>> getKec(String kec) async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> data = {"kode": kec};
    Uri _uri = Uri.https(baseApi, getKecApi, data);
    var token = prefs.get("token");
    try {
      var provResponse = await http.post(_uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      if (provResponse.statusCode != 200) {
        throw Exception("Status code != 200");
      }
      List<Wilayah> kecs =
          GetKecModel.fromJson(json.decode(provResponse.body)).wilayah;
      return kecs;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
