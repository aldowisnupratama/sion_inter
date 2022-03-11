class UpdateBiodataModel {
  UpdateBiodataModel({
    required this.result,
    required this.message,
  });
  late final String result;
  late final String message;

  UpdateBiodataModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
  }
}
