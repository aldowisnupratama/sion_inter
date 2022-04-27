class BiodataDiktiModel {
  BiodataDiktiModel({
    required this.biodataDikti,
    required this.message,
  });
  late final BiodataDikti biodataDikti;
  late final String message;

  BiodataDiktiModel.fromJson(Map<String, dynamic> json) {
    biodataDikti = BiodataDikti.fromJson(json['biodata']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['biodata'] = biodataDikti.toJson();
    _data['message'] = message;
    return _data;
  }
}

class BiodataDikti {
  BiodataDikti({
    required this.nim,
    required this.nik,
    required this.nama,
    required this.ponsel,
    required this.alamat,
    required this.kelurahan,
    required this.provinsi,
    required this.kabupaten,
    required this.kecamatan,
    required this.orangtua,
  });
  late final String nim;
  late final String nik;
  late final String nama;
  late final String ponsel;
  late final String alamat;
  late final String kelurahan;
  late final String provinsi;
  late final String kabupaten;
  late final String kecamatan;
  late final String orangtua;

  BiodataDikti.fromJson(Map<String, dynamic> json) {
    nim = json['nim'];
    nik = json['nik'];
    nama = json['nama'];
    ponsel = json['ponsel'];
    alamat = json['alamat'];
    kelurahan = json['kelurahan'];
    provinsi = json['provinsi'];
    kabupaten = json['kabupaten'];
    kecamatan = json['kecamatan'];
    orangtua = json['orangtua'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nim'] = nim;
    _data['nik'] = nik;
    _data['nama'] = nama;
    _data['ponsel'] = ponsel;
    _data['alamat'] = alamat;
    _data['kelurahan'] = kelurahan;
    _data['provinsi'] = provinsi;
    _data['kabupaten'] = kabupaten;
    _data['kecamatan'] = kecamatan;
    _data['orangtua'] = orangtua;
    return _data;
  }
}
