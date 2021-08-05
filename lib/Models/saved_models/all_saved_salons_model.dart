class AllSavedSalonsModel {
  List<Data> data;

  AllSavedSalonsModel({this.data});

  AllSavedSalonsModel.fromJson(Map<String, dynamic> json) {
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
  String type;
  String userId;
  Item item;

  Data({this.id, this.type, this.userId, this.item});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    userId = json['user_id'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    return data;
  }
}

class Item {
  int id;
  String nameEn;
  String nameAr;
  String descriptionEn;
  String descriptionAr;
  String images;
  List<Location> location;
  Category category;
  List<Specialities> specialities;

  Item(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.descriptionEn,
        this.descriptionAr,
        this.images,
        this.location,
        this.category,
        this.specialities});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    images = json['images'];
    if (json['location'] != null) {
      location = new List<Location>();
      json['location'].forEach((v) {
        location.add(new Location.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['specialities'] != null) {
      specialities = new List<Specialities>();
      json['specialities'].forEach((v) {
        specialities.add(new Specialities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['images'] = this.images;
    if (this.location != null) {
      data['location'] = this.location.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.specialities != null) {
      data['specialities'] = this.specialities.map((v) => v.toJson()).toList();
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

class Category {
  int id;
  String nameEn;
  String nameAr;
  String image;
  String type;
  List<Products> products;

  Category(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.image,
        this.type,
        this.products});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    type = json['type'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['type'] = this.type;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String nameEn;
  String nameAr;
  String price;
  String image;
  String descriptionEn;
  String descriptionAr;
  String quantity;
  List<Null> ratings;
  String categoryId;

  Products(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.price,
        this.image,
        this.descriptionEn,
        this.descriptionAr,
        this.quantity,
        this.ratings,
        this.categoryId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    price = json['price'];
    image = json['image'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    quantity = json['quantity'];
//    if (json['ratings'] != null) {
//      ratings = new List<Null>();
//      json['ratings'].forEach((v) {
//        ratings.add(new Null.fromJson(v));
//      });
//    }
    categoryId = json['category_id'];
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
//    if (this.ratings != null) {
//      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
//    }
    data['category_id'] = this.categoryId;
    return data;
  }
}

class Specialities {
  int id;
  String nameEn;
  String nameAr;
  String image;

  Specialities({this.id, this.nameEn, this.nameAr, this.image});

  Specialities.fromJson(Map<String, dynamic> json) {
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
