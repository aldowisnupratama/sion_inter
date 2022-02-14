class Pengumuman {
  String? judul;
  String? tglMulai;
  String? tglSelesai;
  String? prioritas;
  String? pengumuman;
  String? dirUpload;
  String? fileName;

  Pengumuman.fromJson(Map json) {
    judul = json['judul_pengumuman'];
    tglMulai = json['tgl_mulai_pengumuman'];
    tglSelesai = json['tgl_selesai_pengumuman'];
    prioritas = json['ispriority'];
    pengumuman = json['isi_pengumuman'];
    dirUpload = json['filepath_pengumuman'];
    fileName = json['namafile_pengumuman'];
  }
}

class AnnouncementModel {
  List<Pengumuman>? pengumuman = <Pengumuman>[];
  String? message;
  String? result;

  AnnouncementModel.fromJson(Map json) {
    if (json['pengumuman'] != null) {
      json['pengumuman'].forEach((v) {
        pengumuman!.add(Pengumuman.fromJson(v));
      });
    }
    message = json['message'];
    result = json['result'];
    print("pengumumannn boss : ${pengumuman!.length}");
  }
}
