class SingleBarberModel {
  Data data;

  SingleBarberModel({this.data});

  SingleBarberModel.fromJson(Map<String, dynamic> json) {
    data = json['0'] != null ? new Data.fromJson(json['0']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['0'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String image;
  String email;
  String phone;
  String type;
  Null fees;
  List<Services> services;
  Null experience;
  List<Availability> availability;
  List<Specifications> specifications;

  Data(
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
        this.specifications});

  Data.fromJson(Map<String, dynamic> json) {
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

class Availability {
  int id;
  String day;
  String startTime;
  String endDate;

  Availability({this.id, this.day, this.startTime, this.endDate});

  Availability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startTime = json['start_time'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_date'] = this.endDate;
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
