class SingleUserModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String code;
  final String percentage;
  final String start_date;
  final String end_date;
  final String image;
  SingleUserModel(
      {this.id,
        this.name_en,
        this.name_ar,
        this.image,
        this.code,
        this.end_date,
        this.start_date,
        this.percentage});

  factory SingleUserModel.fromJson(Map<String, dynamic> json) {
    return SingleUserModel(
      id: json['id'],
      name_ar: json['name_ar'],
      name_en: json['name_en'],
      image: json['image'],
      end_date: json['end_date'],
      start_date: json['start_date'],
      percentage: json['percentage'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': name_ar,
      'name_en': name_en,
      'image': image,
      'end_date': end_date,
      'start_date': start_date,
      'percentage': percentage,
      'code': code
    };
  }
}
