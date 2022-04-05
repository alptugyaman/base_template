import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ChainList {
  ChainList({
    required this.id,
    required this.communityId,
    required this.name,
    required this.nativeTokenId,
    required this.logoUrl,
    required this.wrappedTokenId,
    required this.usdValue,
  });

  late String id;
  late int communityId;
  late String name;
  late String nativeTokenId;
  late String logoUrl;
  late String wrappedTokenId;
  late double usdValue;

  factory ChainList.fromJson(Map<String, dynamic> json) =>
      _$ChainListFromJson(json);
}
