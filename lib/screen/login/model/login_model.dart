class LoginModel {
  int? status;
  String? massage;
  Data? data;

  LoginModel({this.status, this.massage, this.data});

  LoginModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massage'] = this.massage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? role;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? active;
  String? width;
  String? hight;

  User(
      {this.id,
        this.name,
        this.email,
        this.role,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.active,
        this.width,
        this.hight});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
    width = json['width'];
    hight = json['hight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active'] = this.active;
    data['width'] = this.width;
    data['hight'] = this.hight;
    return data;
  }
}
