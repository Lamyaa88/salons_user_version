class SearchProductsModel {
  List<Data> data;

  SearchProductsModel({this.data});

  SearchProductsModel.fromJson(Map<String, dynamic> json) {
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
  String price;
  String image;
  String descriptionEn;
  String descriptionAr;
  String quantity;
  Category category;
  Store store;

  Data(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.price,
        this.image,
        this.descriptionEn,
        this.descriptionAr,
        this.quantity,
        this.category,
        this.store});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    price = json['price'];
    image = json['image'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    quantity = json['quantity'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['quantity'] = this.quantity;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  String nameEn;
  String nameAr;
  String image;

  Category({this.id, this.nameEn, this.nameAr, this.image});

  Category.fromJson(Map<String, dynamic> json) {
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

class Store {
  int id;
  String nameEn;
  String nameAr;
  String image;
  List<Location> location;

  Store({this.id, this.nameEn, this.nameAr, this.image, this.location});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    if (json['location'] != null) {
      location = new List<Location>();
      json['location'].forEach((v) {
        location.add(new Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    if (this.location != null) {
      data['location'] = this.location.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String lat;
  String lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
