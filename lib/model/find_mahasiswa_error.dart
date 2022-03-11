class FindMahasiswaError {
  final String message;
  final String error;

  FindMahasiswaError({required this.error, required this.message});

  static FindMahasiswaError fromJson(dynamic json) {
    return FindMahasiswaError(
        error: json["error"] as String, message: json["message"] as String);
  }
}
