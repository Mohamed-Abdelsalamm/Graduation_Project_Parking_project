class UserRegisterResponse {
  int? id;
  String? mail;
  String? fullName;

  UserRegisterResponse({this.id, this.mail, this.fullName});

  UserRegisterResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mail = json['mail'];
    fullName = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mail'] = this.mail;
    data['fullname'] = this.fullName;
    return data;
  }
}
