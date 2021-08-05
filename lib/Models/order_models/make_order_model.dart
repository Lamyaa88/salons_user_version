import 'package:flutter/material.dart';

class MakeOrderModel {
  final int id;
  final String name_en;
  final String name_ar;
  final String image;

  MakeOrderModel({
    this.id,
    this.name_en,
    this.name_ar,
    this.image,
  });

  factory MakeOrderModel.fromJson(Map<String, dynamic> json) {
    return MakeOrderModel(
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
