class SingleSalonModel {
  Data data;

  SingleSalonModel({this.data});

  SingleSalonModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String nameEn;
  String nameAr;
  String descriptionEn;
  String descriptionAr;
  String images;
  List<Location> location;
  Category category;
  List<Barbers> barbers;
  List<Specialities> specialities;

  Data(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.descriptionEn,
        this.descriptionAr,
        this.images,
        this.location,
        this.category,
        this.barbers,
        this.specialities});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['barbers'] != null) {
      barbers = new List<Barbers>();
      json['barbers'].forEach((v) {
        barbers.add(new Barbers.fromJson(v));
      });
    }
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
    if (this.barbers != null) {
      data['barbers'] = this.barbers.map((v) => v.toJson()).toList();
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

class Barbers {
  int id;
  String name;
  String image;
  String email;
  String phone;
  String type;
  String fees;
  List<Services> services;
  String experience;
  List<Availability> availability;
  List<Specifications> specifications;
  List<Ratings> ratings;

  Barbers(
      {this.id,
        this.name,
        this.image,
        this.email,
        this.phone,
        this.type,
        this.fees,
        this.services,
        this.experience,
        this.availability,
        this.specifications,
        this.ratings});

  Barbers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    fees = json['fees'];
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
    experience = json['experience'];
    if (json['availability'] != null) {
      availability = new List<Availability>();
      json['availability'].forEach((v) {
        availability.add(new Availability.fromJson(v));
      });
    }
    if (json['specifications'] != null) {
      specifications = new List<Specifications>();
      json['specifications'].forEach((v) {
        specifications.add(new Specifications.fromJson(v));
      });
    }
    if (json['ratings'] != null) {
      ratings = new List<Ratings>();
      json['ratings'].forEach((v) {
        ratings.add(new Ratings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['fees'] = this.fees;
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    data['experience'] = this.experience;
    if (this.availability != null) {
      data['availability'] = this.availability.map((v) => v.toJson()).toList();
    }
    if (this.specifications != null) {
      data['specifications'] =
          this.specifications.map((v) => v.toJson()).toList();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Services {
  int id;
  String nameEn;
  String nameAr;

  Services({this.id, this.nameEn, this.nameAr});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    return data;
  }
}
class Specialities {
  int id;
  String nameEn;
  String nameAr;
  String image ;

  Specialities({this.id, this.nameEn, this.nameAr , this.image});

  Specialities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json["image"];
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

class Availability {
  int id;
  String day;
  String startTime;
  String endDate;
  String date;

  Availability({this.id, this.day, this.startTime, this.endDate, this.date});

  Availability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_date'] = this.endDate;
    data['date'] = this.date;
    return data;
  }
}

class Specifications {
  int id;
  String nameEn;
  String nameAr;
  String image;

  Specifications({this.id, this.nameEn, this.nameAr, this.image});

  Specifications.fromJson(Map<String, dynamic> json) {
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

class Ratings {
  int id;
  String rate;
  String review;
  String type;
  String ratableId;
  String userId;
  User user;

  Ratings(
      {this.id,
        this.rate,
        this.review,
        this.type,
        this.ratableId,
        this.userId,
        this.user});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    review = json['review'];
    type = json['type'];
    ratableId = json['ratable_id'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['review'] = this.review;
    data['type'] = this.type;
    data['ratable_id'] = this.ratableId;
    data['user_id'] = this.userId;
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
  List<Null> location;

  User(
      {this.id,
        this.name,
        this.image,
        this.email,
        this.phone,
        this.type,
        this.location});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
//    if (json['location'] != null) {
//      location = new List<Null>();
//      json['location'].forEach((v) {
//        location.add(new Null.fromJson(v));
//      });
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
