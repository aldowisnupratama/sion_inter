class FindMahasiswaModel {
  FindMahasiswaModel({
    required this.mahasiswa,
    required this.message,
  });
  late final List<Mahasiswa> mahasiswa;
  late final String message;
  
  FindMahasiswaModel.fromJson(Map<String, dynamic> json){
    mahasiswa = List.from(json['mahasiswa']).map((e)=>Mahasiswa.fromJson(e)).toList();
    message = json['message'];
  }

}

class Mahasiswa {
  Mahasiswa({
    required this.nim,
    required this.nama,
    required this.prodi,
    required this.status,
  });
  late final String nim;
  late final String nama;
  late final String prodi;
  late final String status;
  
  Mahasiswa.fromJson(Map<String, dynamic> json){
    nim = json['nim'];
    nama = json['nama'];
    prodi = json['prodi'];
    status = json['status'];
  }

 
}