import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class Login {
  bool? success;
  String? token;
  String? tokenType;
  int? expiresIn;
  String? refreshToken;

  Login({
    this.success,
    this.token,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}
