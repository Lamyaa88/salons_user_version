class EmptyCartModel{
  final int id;
  final String name_en;
  final String name_ar;
  final String image;

  EmptyCartModel({
    this.id,
    this.name_en,
    this.name_ar,
    this.image,
  });

  factory EmptyCartModel.fromJson(Map<String, dynamic> json) {
    return EmptyCartModel(
      id: json['id'],
      name_en: json['name_en'],
      name_ar: json['name_ar'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': name_en,
      'name_ar': name_ar,
      'image': image,
    };
  }
}
