class OfferModels {
  final int id;
  final String name_en;
  final String name_ar;
  final String code;
  final String start_date;
  final String end_date;
  final String percentage;
  final String image;

  OfferModels({
    this.id,
    this.name_en,
    this.name_ar,
    this.code,
    this.start_date,
    this.end_date,
    this.percentage,
    this.image,
  });

  factory OfferModels.fromJson(Map<String, dynamic> json) {
    return OfferModels(
      id: json['id'],
      name_en: json['name_en'],
      name_ar: json['name_ar'],
      code: json['code'],
      start_date: json['start_date'],
      end_date: json['end_date'],
      percentage: json['percentage'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': name_en,
      'name_ar': name_ar,
      'code': code,
      'start_date': start_date,
      'end_date': end_date,
      'percentage': percentage,
      'image': image,
    };
  }
}
