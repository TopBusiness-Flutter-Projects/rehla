// To parse this JSON data, do
//
//     final carsBrands = carsBrandsFromJson(jsonString);

import 'dart:convert';

List<CarsBrands>? carsBrandsFromJson(String str) => json.decode(str) == null ? [] : List<CarsBrands>.from(json.decode(str)!.map((x) => CarsBrands.fromJson(x)));

String carsBrandsToJson(List<CarsBrands?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class CarsBrands {
  CarsBrands({
    this.brand,
    this.models,
  });

  String? brand;
  List<String>? models;

  factory CarsBrands.fromJson(Map<String, dynamic> json) => CarsBrands(
    brand: json["brand"],
    models: json["models"] == null ? [] : List<String>.from(json["models"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "models": models == null ? [] : List<dynamic>.from(models!.map((x) => x)),
  };
}
