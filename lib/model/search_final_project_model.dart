class SearchFinalProjectModel {
  SearchFinalProjectModel({
    required this.judul,
    required this.message,
  });
  late final List<Judul> judul;
  late final String message;

  SearchFinalProjectModel.fromJson(Map<String, dynamic> json) {
    judul = List.from(json['judul']).map((e) => Judul.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['judul'] = judul.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Judul {
  Judul({
    required this.nim,
    required this.judul,
  });
  late final String nim;
  late final String judul;

  Judul.fromJson(Map<String, dynamic> json) {
    nim = json['nim'];
    judul = json['judul'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nim'] = nim;
    _data['judul'] = judul;
    return _data;
  }
}
