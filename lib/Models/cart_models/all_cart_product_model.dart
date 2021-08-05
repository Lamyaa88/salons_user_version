class AllCartProductsModel {
  Cart cart;
  int subTotalPrice;
  int total;

  AllCartProductsModel({this.cart, this.subTotalPrice, this.total});

  AllCartProductsModel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    subTotalPrice = json['sub_total_price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart.toJson();
    }
    data['sub_total_price'] = this.subTotalPrice;
    data['total'] = this.total;
    return data;
  }
}

class Cart {
  int id;
  User user;
  Offer offer;
  List<Cartitems> cartitems;

  Cart({this.id, this.user, this.offer, this.cartitems});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
    if (json['cartitems'] != null) {
      cartitems = new List<Cartitems>();
      json['cartitems'].forEach((v) { cartitems.add(new Cartitems.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.offer != null) {
      data['offer'] = this.offer.toJson();
    }
    if (this.cartitems != null) {
      data['cartitems'] = this.cartitems.map((v) => v.toJson()).toList();
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
  List<List> location;

  User({this.id, this.name, this.image, this.email, this.phone, this.type, this.location});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
//    if (json['location'] != null) {
//      location = new List<List>();
//      json['location'].forEach((v) { location.add(new List.fromJson(v)); });
//    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
//    if (this.location != null) {
//      data['location'] = this.location.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}

//class Location {
//
//
//  Location({});
//
//Location.fromJson(Map<String, dynamic> json) {
//}

//Map<String, dynamic> toJson() {
//  final Map<String, dynamic> data = new Map<String, dynamic>();
//  return data;
//}
//}

class Offer {
  int id;
  String nameEn;
  String nameAr;
  String code;
  String value;
  String startDate;
  String endDate;
  String image;

  Offer({this.id, this.nameEn, this.nameAr, this.code, this.value, this.startDate, this.endDate, this.image});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    code = json['code'];
    value = json['value'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['code'] = this.code;
    data['value'] = this.value;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['image'] = this.image;
    return data;
  }
}

class Cartitems {
  int id;
  String qty;
  Product product;
  String price;

  Cartitems({this.id, this.qty, this.product, this.price});

  Cartitems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qty'] = this.qty;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['price'] = this.price;
    return data;
  }
}

class Product {
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

  Product({this.id, this.nameEn, this.nameAr, this.price, this.image, this.descriptionEn, this.descriptionAr, this.quantity, this.ratings, this.categoryId});

  Product.fromJson(Map<String, dynamic> json) {
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
//      json['ratings'].forEach((v) { ratings.add(new Null.fromJson(v)); });
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
