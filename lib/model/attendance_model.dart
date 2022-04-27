class AbsensiModel {
  AbsensiModel({
    required this.absensi,
    required this.message,
  });
  late final List<Absensi> absensi;
  late final String message;

  AbsensiModel.fromJson(Map<String, dynamic> json) {
    absensi =
        List.from(json['absensi']).map((e) => Absensi.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['absensi'] = absensi.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Absensi {
  Absensi({
    required this.kodeMatakuliah,
    required this.namaMatakuliah,
    required this.absen1,
    required this.absen2,
    required this.absen3,
    required this.absen4,
    required this.absen5,
    required this.absen6,
    required this.absen7,
    required this.absen8,
    required this.absen9,
    required this.absen10,
    required this.absen11,
    required this.absen12,
    required this.absen13,
    required this.absen14,
    required this.absen15,
  });
  late final String kodeMatakuliah;
  late final String namaMatakuliah;
  late final String absen1;
  late final String absen2;
  late final String absen3;
  late final String absen4;
  late final String absen5;
  late final String absen6;
  late final String absen7;
  late final String absen8;
  late final String absen9;
  late final String absen10;
  late final String absen11;
  late final String absen12;
  late final String absen13;
  late final String absen14;
  late final String absen15;

  Absensi.fromJson(Map<String, dynamic> json) {
    kodeMatakuliah = json['kode_matakuliah'];
    namaMatakuliah = json['nama_matakuliah'];
    absen1 = json['absen1'];
    absen2 = json['absen2'];
    absen3 = json['absen3'];
    absen4 = json['absen4'];
    absen5 = json['absen5'];
    absen6 = json['absen6'];
    absen7 = json['absen7'];
    absen8 = json['absen8'];
    absen9 = json['absen9'];
    absen10 = json['absen10'];
    absen11 = json['absen11'];
    absen12 = json['absen12'];
    absen13 = json['absen13'];
    absen14 = json['absen14'];
    absen15 = json['absen15'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kode_matakuliah'] = kodeMatakuliah;
    _data['nama_matakuliah'] = namaMatakuliah;
    _data['absen1'] = absen1;
    _data['absen2'] = absen2;
    _data['absen3'] = absen3;
    _data['absen4'] = absen4;
    _data['absen5'] = absen5;
    _data['absen6'] = absen6;
    _data['absen7'] = absen7;
    _data['absen8'] = absen8;
    _data['absen9'] = absen9;
    _data['absen10'] = absen10;
    _data['absen11'] = absen11;
    _data['absen12'] = absen12;
    _data['absen13'] = absen13;
    _data['absen14'] = absen14;
    _data['absen15'] = absen15;
    return _data;
  }
}
