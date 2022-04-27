class FinalProjectTopicsModel {
  FinalProjectTopicsModel({
    required this.topic,
    required this.message,
  });
  late final List<FinalProjectTopic> topic;
  late final String message;

  FinalProjectTopicsModel.fromJson(Map<String, dynamic> json) {
    topic = List.from(json['jadwal'])
        .map((e) => FinalProjectTopic.fromJson(e))
        .toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['jadwal'] = topic.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class FinalProjectTopic {
  FinalProjectTopic({
    required this.nim,
    required this.judul,
    required this.kodeDosen,
    required this.namaDosen,
  });
  late final String nim;
  late final String judul;
  late final String kodeDosen;
  late final String namaDosen;

  FinalProjectTopic.fromJson(Map<String, dynamic> json) {
    nim = json['nim'];
    judul = json['judul'];
    kodeDosen = json['kode_dosen'];
    namaDosen = json['nama_dosen'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nim'] = nim;
    _data['judul'] = judul;
    _data['kode_dosen'] = kodeDosen;
    _data['nama_dosen'] = namaDosen;
    return _data;
  }
}
