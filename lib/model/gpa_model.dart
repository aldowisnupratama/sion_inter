class GPAModel {
  GPAModel({
    required this.ip,
    required this.message,
  });
  List<GPA>? ip;
  String? message;

  GPAModel.fromJson(Map<String, dynamic> json) {
    ip = List.from(json['ip']).map((e) => GPA.fromJson(e)).toList();
    message = json['result'];
  }
}

class GPA {
  String? semester;
  String? ipSemester;
  String? ipKumulatif;
  String? sksSemester;
  String? sksKumulatif;
  GPA({
    required this.semester,
    required this.ipSemester,
    required this.ipKumulatif,
    required this.sksSemester,
    required this.sksKumulatif,
  });

  GPA.fromJson(Map<String, dynamic> json) {
    semester = json['semester'];
    ipSemester = json['ip_semester'];
    ipKumulatif = json['ip_kumulatif'];
    sksSemester = json['sks_semester'];
    sksKumulatif = json['sks_kumulatif'];
  }
}
