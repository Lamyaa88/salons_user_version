class AllAdsModel {
  List<Data> data;

  AllAdsModel({this.data});

  AllAdsModel.fromJson(Map<String, dynamic> json) {
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
  String nameEn;
  String nameAr;
  String link;
  String startDate;
  String endDate;
  Null image;

  Data(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.link,
        this.startDate,
        this.endDate,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    link = json['link'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['link'] = this.link;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['image'] = this.image;
    return data;
  }
}
