class AllAddressesModel {
  List<Data> data;

  AllAddressesModel({this.data});

  AllAddressesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String icon;
//  List<Null> location;
  User user;

  Data({this.id, this.name, this.icon,
//    this.location
     this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    if (json['location'] != null) {
//      location = new List<Null>();
//      json['location'].forEach((v) {
////        location.add(new Null.fromJson(v));
//      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
//    if (this.location != null) {
//      data['location'] = this.location.map((v) => v.toJson()).toList();
//    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String image;
  String email;
  String phone;
  String type;

  User({this.id, this.name, this.image, this.email, this.phone, this.type});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    return data;
  }
}
