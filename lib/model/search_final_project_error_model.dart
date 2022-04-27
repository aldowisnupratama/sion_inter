class SearchFinalProjectErrorModel {
  SearchFinalProjectErrorModel({
    required this.error,
    required this.message,
  });
  late final List<String> error;
  late final String message;

  SearchFinalProjectErrorModel.fromJson(Map<String, dynamic> json) {
    error = List.castFrom<dynamic, String>(json['error']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['message'] = message;
    return _data;
  }
}
