class AllSpecificationsModel {
  List<Data> data;

  AllSpecificationsModel({this.data});

  AllSpecificationsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  List<Data>();
      json['data'].forEach((v) {
        data.add( Data.fromJson(v));
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
  String nameEn;
  String nameAr;
  String image;

  Data({this.id, this.nameEn, this.nameAr, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    return data;
  }
}