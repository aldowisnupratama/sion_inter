class UpdateBiodataDiktiSuccessModel {
  UpdateBiodataDiktiSuccessModel({
    required this.result,
    required this.message,
  });
  late final String result;
  late final String message;

  UpdateBiodataDiktiSuccessModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result;
    _data['message'] = message;
    return _data;
  }
}
