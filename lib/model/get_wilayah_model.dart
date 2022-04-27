class GetProvModel {
  GetProvModel({
    required this.wilayah,
    required this.message,
  });
  late final List<Wilayah> wilayah;
  late final String message;

  GetProvModel.fromJson(Map<String, dynamic> json) {
    wilayah =
        List.from(json['wilayah']).map((e) => Wilayah.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['wilayah'] = wilayah.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class GetKabModel {
  GetKabModel({
    required this.wilayah,
    required this.message,
  });
  late final List<Wilayah> wilayah;
  late final String message;

  GetKabModel.fromJson(Map<String, dynamic> json) {
    wilayah =
        List.from(json['wilayah']).map((e) => Wilayah.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['wilayah'] = wilayah.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class GetKecModel {
  GetKecModel({
    required this.wilayah,
    required this.message,
  });
  late final List<Wilayah> wilayah;
  late final String message;

  GetKecModel.fromJson(Map<String, dynamic> json) {
    wilayah =
        List.from(json['wilayah']).map((e) => Wilayah.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['wilayah'] = wilayah.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Wilayah {
  Wilayah({
    required this.kodeWilayah,
    required this.namaWilayah,
    required this.jenisWilayah,
  });
  late final String kodeWilayah;
  late final String namaWilayah;
  late final String jenisWilayah;

  Wilayah.fromJson(Map<String, dynamic> json) {
    kodeWilayah = json['kode_wilayah'];
    namaWilayah = json['nama_wilayah'];
    jenisWilayah = json['jenis_wilayah'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kode_wilayah'] = kodeWilayah;
    _data['nama_wilayah'] = namaWilayah;
    _data['jenis_wilayah'] = jenisWilayah;
    return _data;
  }
}
