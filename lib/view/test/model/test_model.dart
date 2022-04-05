import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class Test {
  int? id;
  String? groupName;
  String? name;
  String? title;
  String? createdDate;

  Test({
    this.id,
    this.groupName,
    this.name,
    this.title,
    this.createdDate,
  });

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
}

Test testFromJson(dynamic data) => Test.fromJson(data as Map<String, dynamic>);
