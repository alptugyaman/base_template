// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'last_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class Nutritions {
  String? groupName;
  @JsonKey(fromJson: _nuts, name: 'content')
  List<Nutrition>? nutrition;

  Nutritions({
    this.groupName,
    this.nutrition,
  });

  factory Nutritions.fromJson(Map<String, dynamic> json) =>
      _$NutritionsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Nutrition {
  @JsonKey(name: 'Yemek')
  String? food;
  @JsonKey(name: 'Image')
  String? image;

  Nutrition({
    this.food,
    this.image,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);
}

List<Nutrition>? _nuts(String json) {
  List<Nutrition> nutrition = [];

  final List parsed = jsonDecode(json) as List;

  return nutrition =
      parsed.map((e) => Nutrition.fromJson(e as Map<String, dynamic>)).toList();
}
