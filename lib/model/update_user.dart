class UpdateUser {
  Data? data;

  UpdateUser({this.data});

  UpdateUser.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Image? image;
  String? sId;
  String? name;
  String? email;
  String? gender;
  String? phone;
  String? whatsapp;
  String? password;
  String? role;
  bool? active;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.image,
      this.sId,
      this.name,
      this.email,
      this.gender,
      this.phone,
      this.whatsapp,
      this.password,
      this.role,
      this.active,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    password = json['password'];
    role = json['role'];
    active = json['active'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    data['password'] = this.password;
    data['role'] = this.role;
    data['active'] = this.active;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Image {
  String? url;
  String? imageId;

  Image({this.url, this.imageId});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = this.url;
    data['imageId'] = this.imageId;
    return data;
  }
}
