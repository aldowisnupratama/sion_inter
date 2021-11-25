class BiodataModel {
  Biodata? biodata;
  String? message;

  BiodataModel({this.biodata, this.message});

  BiodataModel.fromJson(Map<String, dynamic> json) {
    biodata =
        json['biodata'] != null ? new Biodata.fromJson(json['biodata']) : null;
    message = json['result'];
  }
}

class Biodata {
  String? nim;
  String? nama;
  String? kodeCama;
  String? angkatan;
  String? alamat;
  String? jaminan;
  String? transfer;
  String? karyawan;
  String? statusKelas;
  String? kampus;
  String? sisipan;
  String? tanggalLahir;
  String? tempatLahir;
  String? ponsel;
  String? ayah;
  String? ibu;
  String? gender;
  String? email;
  String? facebook;
  String? twitter;
  String? nisn;
  String? nik;
  String? kodeProdi;
  String? namaProdi;
  String? kodeAgama;
  String? namaAgama;
  String? kodeDosenwali;
  String? namaDosenwali;
  String? provinsi;
  String? kabupaten;
  String? kecamatan;
  String? desa;
  String? kps;

  Biodata(
      {this.nim,
      this.nama,
      this.kodeCama,
      this.angkatan,
      this.alamat,
      this.jaminan,
      this.transfer,
      this.karyawan,
      this.statusKelas,
      this.kampus,
      this.sisipan,
      this.tanggalLahir,
      this.tempatLahir,
      this.ponsel,
      this.ayah,
      this.ibu,
      this.gender,
      this.email,
      this.facebook,
      this.twitter,
      this.nisn,
      this.nik,
      this.kodeProdi,
      this.namaProdi,
      this.kodeAgama,
      this.namaAgama,
      this.kodeDosenwali,
      this.namaDosenwali,
      this.provinsi,
      this.kabupaten,
      this.kecamatan,
      this.desa,
      this.kps});

  Biodata.fromJson(Map<String, dynamic> json) {
    nim = json['nim'];
    nama = json['nama'];
    kodeCama = json['kode_cama'];
    angkatan = json['angkatan'];
    alamat = json['alamat'];
    jaminan = json['jaminan'];
    transfer = json['transfer'];
    karyawan = json['karyawan'];
    statusKelas = json['status_kelas'];
    kampus = json['kampus'];
    sisipan = json['sisipan'];
    tanggalLahir = json['tanggal_lahir'];
    tempatLahir = json['tempat_lahir'];
    ponsel = json['ponsel'];
    ayah = json['ayah'];
    ibu = json['ibu'];
    gender = json['gender'];
    email = json['email'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    nisn = json['nisn'];
    nik = json['nik'];
    kodeProdi = json['kode_prodi'];
    namaProdi = json['nama_prodi'];
    kodeAgama = json['kode_agama'];
    namaAgama = json['nama_agama'];
    kodeDosenwali = json['kode_dosenwali'];
    namaDosenwali = json['nama_dosenwali'];
    provinsi = json['provinsi'];
    kabupaten = json['kabupaten'];
    kecamatan = json['kecamatan'];
    desa = json['desa'];
    kps = json['kps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nim'] = this.nim;
    data['nama'] = this.nama;
    data['kode_cama'] = this.kodeCama;
    data['angkatan'] = this.angkatan;
    data['alamat'] = this.alamat;
    data['jaminan'] = this.jaminan;
    data['transfer'] = this.transfer;
    data['karyawan'] = this.karyawan;
    data['status_kelas'] = this.statusKelas;
    data['kampus'] = this.kampus;
    data['sisipan'] = this.sisipan;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['tempat_lahir'] = this.tempatLahir;
    data['ponsel'] = this.ponsel;
    data['ayah'] = this.ayah;
    data['ibu'] = this.ibu;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['nisn'] = this.nisn;
    data['nik'] = this.nik;
    data['kode_prodi'] = this.kodeProdi;
    data['nama_prodi'] = this.namaProdi;
    data['kode_agama'] = this.kodeAgama;
    data['nama_agama'] = this.namaAgama;
    data['kode_dosenwali'] = this.kodeDosenwali;
    data['nama_dosenwali'] = this.namaDosenwali;
    data['provinsi'] = this.provinsi;
    data['kabupaten'] = this.kabupaten;
    data['kecamatan'] = this.kecamatan;
    data['desa'] = this.desa;
    data['kps'] = this.kps;
    return data;
  }
}
