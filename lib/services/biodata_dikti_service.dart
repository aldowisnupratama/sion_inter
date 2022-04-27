import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/shared/shared.dart';
import '../model/model.dart';

class BiodataDiktiService {
  Future<BiodataDiktiModel> fetchBiodataDikti() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    Uri uri = Uri.https(baseApi, getBiodataDikti);

    try {
      var diktiResponse = await http.get(uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      if (diktiResponse.statusCode == 401) {
        throw Exception("Token wrong");
      }
      if (diktiResponse.statusCode == 404) {
        throw Exception("Page not found");
      }

      return BiodataDiktiModel.fromJson(json.decode(diktiResponse.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UpdateBiodataDiktiSuccessModel> updateBiodata(
      var nik, nama, ponsel, alamat, kelurahan, prov, kab, kec, ortu) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    Map<String, dynamic> data = {
      "nik": nik,
      "nama": nama,
      "ortu": ortu,
      "alamat": alamat,
      "ponsel": ponsel,
      "prov": prov,
      "kab": kab,
      "kec": kec,
      "kelurahan": kelurahan,
    };
    Uri uri = Uri.https(baseApi, updateBiodataDiktiApi, data);
    try {
      var updateBiodataDiktiResponse = await http.post(uri, headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Charset": "utf-8",
        "Authorization": "$token"
      });
      if (updateBiodataDiktiResponse.statusCode == 401) {
        throw Exception("Token wrong");
      }
      if (updateBiodataDiktiResponse.statusCode == 404) {
        throw Exception("Page not found");
      }
      if (updateBiodataDiktiResponse.statusCode == 405) {
        throw UpdateBiodataDiktiFailModel.fromJson(
            json.decode(updateBiodataDiktiResponse.body));
      }
      return UpdateBiodataDiktiSuccessModel.fromJson(
          json.decode(updateBiodataDiktiResponse.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
