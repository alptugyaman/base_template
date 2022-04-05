// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nutritions _$NutritionsFromJson(Map<String, dynamic> json) => Nutritions(
      groupName: json['group_name'] as String?,
      nutrition: _nuts(json['content'] as String),
    );

Nutrition _$NutritionFromJson(Map<String, dynamic> json) => Nutrition(
      food: json['Yemek'] as String?,
      image: json['Image'] as String?,
    );
