class ScheduleModel {
  ScheduleModel({
    required this.jadwalKuliah,
    required this.message,
  });
  late final List<JadwalKuliah> jadwalKuliah;
  late final String message;

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    jadwalKuliah = List.from(json['jadwal_kuliah'])
        .map((e) => JadwalKuliah.fromJson(e))
        .toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['jadwal_kuliah'] = jadwalKuliah.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class JadwalKuliah {
  JadwalKuliah({
    required this.hari,
    required this.kodeMatkul,
    required this.namaMatkul,
    required this.kodeKelas,
    required this.namaKelas,
    required this.ruang,
    required this.namaDosen,
    required this.jam,
  });
  late final String hari;
  late final String kodeMatkul;
  late final String namaMatkul;
  late final String kodeKelas;
  late final String namaKelas;
  late final String ruang;
  late final String namaDosen;
  late final String jam;

  JadwalKuliah.fromJson(Map<String, dynamic> json) {
    hari = json['hari'];
    kodeMatkul = json['kode_matkul'];
    namaMatkul = json['nama_matkul'];
    kodeKelas = json['kode_kelas'];
    namaKelas = json['nama_kelas'];
    ruang = json['ruang'];
    namaDosen = json['nama_dosen'];
    jam = json['jam'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hari'] = hari;
    _data['kode_matkul'] = kodeMatkul;
    _data['nama_matkul'] = namaMatkul;
    _data['kode_kelas'] = kodeKelas;
    _data['nama_kelas'] = namaKelas;
    _data['ruang'] = ruang;
    _data['nama_dosen'] = namaDosen;
    _data['jam'] = jam;
    return _data;
  }
}
