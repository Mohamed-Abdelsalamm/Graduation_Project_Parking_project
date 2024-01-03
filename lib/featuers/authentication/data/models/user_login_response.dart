class UserLoginResponseModel {
  int? id;
  String? mail;
  String? fullname;
  String? msg;

  UserLoginResponseModel({this.id, this.mail, this.fullname, this.msg});

  UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mail = json['mail'];
    fullname = json['fullname'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mail'] = this.mail;
    data['fullname'] = this.fullname;
    data['msg'] = this.msg;
    return data;
  }
}
