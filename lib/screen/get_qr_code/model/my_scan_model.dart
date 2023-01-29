class MyScanModel {
  int? status;
  String? massage;
  List<Data>? data;

  MyScanModel({this.status, this.massage, this.data});

  MyScanModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massage'] = this.massage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? pin;
  String? serial;
  String? image;
  String? phoneType;
  String? userId;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Data(
      {this.id,
        this.pin,
        this.serial,
        this.image,
        this.phoneType,
        this.userId,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pin = json['pin'];
    serial = json['serial'];
    image = json['image'];
    phoneType = json['phone_type'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pin'] = this.pin;
    data['serial'] = this.serial;
    data['image'] = this.image;
    data['phone_type'] = this.phoneType;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
