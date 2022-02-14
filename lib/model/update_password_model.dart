class UpdatePasswordModel {
  String? result;
  String? message;

  UpdatePasswordModel({this.result, this.message});

  UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
  }
}
