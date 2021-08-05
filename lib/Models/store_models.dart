import 'package:almezyn/Models/location_models.dart';

class StoreModels {
  final int id;
  final String name_en;
  final String name_ar;
  final String image;
  final List<LocationModels> location;

  StoreModels({
    this.id,
    this.name_en,
    this.name_ar,
    this.image,
    this.location
  });

  factory StoreModels.fromJson(Map<String, dynamic> json) {
    return StoreModels(
      id: json['id'],
      name_en: json['name_en'],
      name_ar: json['name_ar'],
      image: json['image'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': name_en,
      'name_ar': name_ar,
      'image': image,
      'location' : location,
    };
  }
}
