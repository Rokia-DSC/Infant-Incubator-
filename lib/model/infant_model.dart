import 'package:flutter/material.dart';

class InfantModel {
  final String title;
  final String data;
  final String image;

  InfantModel( {
    required this.data,
    required this.title,
    required this.image,
  });

    factory InfantModel.fromJson(Map<String, dynamic> json,) {
    return InfantModel(
      title: json['table_name'],
      data: json['result'].toString(),
      image: json['image'],
    );
  }
}
