import 'package:flutter/material.dart';

class AllHomeCategoriesModel {
  final int id;
  final String name_en;
  final String name_ar;
  final String image;

  AllHomeCategoriesModel({
    this.id,
    this.name_en,
    this.name_ar,
    this.image,
  });

  factory AllHomeCategoriesModel.fromJson(Map<String, dynamic> json) {
    return AllHomeCategoriesModel(
      id: json['id'],
      name_ar: json['name_ar'],
      name_en: json['name_en'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': name_ar,
      'name_en': name_en,
      'image': image,
    };
  }
}
