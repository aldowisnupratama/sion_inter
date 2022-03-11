class FindDosenModel {
  FindDosenModel({
    required this.dosen,
    required this.message,
  });
  late final List<Dosen> dosen;
  late final String message;

  FindDosenModel.fromJson(Map<String, dynamic> json) {
    dosen = List.from(json['dosen']).map((e) => Dosen.fromJson(e)).toList();
    message = json['message'];
  }
}

class Dosen {
  Dosen({
    required this.nama,
    required this.alamat,
    required this.nomorHp,
    required this.email,
    required this.jurusan,
    required this.almamater,
  });
  late final String nama;
  late final String alamat;
  late final String nomorHp;
  late final String email;
  late final String jurusan;
  late final String almamater;

  Dosen.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    alamat = json['alamat'];
    nomorHp = json['nomor_hp'];
    email = json['email'];
    jurusan = json['jurusan'];
    almamater = json['almamater'];
  }
}
