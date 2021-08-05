import 'package:almezyn/Models/category_models.dart';
import 'package:almezyn/Models/store_models.dart';

class ProductModels {
  final int id;
  final String name_en;
  final String name_ar;
  final String price;
  final String image;
  final String description_en;
  final String description_ar;
  final String quantity;
  final List<CategoryModel> category;
  final List<StoreModels> store;

  ProductModels({
    this.id,
    this.name_en,
    this.name_ar,
    this.price,
    this.image,
    this.description_en,
    this.description_ar,
    this.quantity,
    this.category,
    this.store,
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) {
    return ProductModels(
      id: json['id'],
      name_en: json['name_en'],
      name_ar: json['name_ar'],
      price: json['price'],
      image: json['image'],
      description_en: json['description_en'],
      description_ar: json['description_ar'],
      quantity: json['quantity'],
      category: json['category'],
      store: json['store'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': name_en,
      'name_ar': name_ar,
      'price': price,
      'image': image,
      'description_en': description_en,
      'description_ar': description_ar,
      'quantity': quantity,
      'category': category,
      'store': store,
    };
  }
}
