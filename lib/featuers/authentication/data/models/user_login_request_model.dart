class UserLoginRequestModel {
  String? mail;
  String? password;
  String? msg;

  UserLoginRequestModel({this.mail, this.password, this.msg});

  UserLoginRequestModel.fromJson(Map<String, dynamic> json) {
    mail = json['mail'];
    password = json['password'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['msg'] = this.msg;
    return data;
  }
}
