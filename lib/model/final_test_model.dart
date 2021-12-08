class FinalTestModel {
  FinalTestModel({
    required this.uas,
    required this.message,
  });
  List<Uas>? uas;
  String? message;

  FinalTestModel.fromJson(Map<String, dynamic> json) {
    uas = List.from(json['uas']).map((e) => Uas.fromJson(e)).toList();
    message = json['result'];
  }
}

class Uas {
  Uas({
    required this.namaMatakuliah,
    required this.hari,
    required this.tanggalUjian,
    required this.kodeKelas,
    required this.namaKelas,
    required this.ruangan,
    required this.kursi,
    required this.jam,
    required this.sks,
    required this.sksPelaksanaan,
    required this.presensi,
  });
  String? namaMatakuliah;
  String? hari;
  String? tanggalUjian;
  String? kodeKelas;
  String? namaKelas;
  String? ruangan;
  String? kursi;
  String? jam;
  String? sks;
  String? sksPelaksanaan;
  String? presensi;

  Uas.fromJson(Map<String, dynamic> json) {
    namaMatakuliah = json['nama_matakuliah'];
    hari = json['hari'];
    tanggalUjian = json['tanggal_ujian'];
    kodeKelas = json['kode_kelas'];
    namaKelas = json['nama_kelas'];
    ruangan = json['ruangan'];
    kursi = json['kursi'];
    jam = json['jam'];
    sks = json['sks'];
    sksPelaksanaan = json['sks_pelaksanaan'];
    presensi = json['presensi'];
  }
}
