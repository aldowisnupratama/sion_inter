class LoginModel {
  String? token;
  String? tokenType;

  String? message;

  LoginModel({this.token, this.tokenType, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    data['message'] = this.message;
    return data;
  }
}
