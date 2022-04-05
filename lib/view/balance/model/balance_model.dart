import 'package:json_annotation/json_annotation.dart';

part 'balance_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Balance {
  double? totalUsdValue;
  List<ChainList>? chainList;

  Balance({this.totalUsdValue, this.chainList});

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ChainList {
  String? id;
  int? communityId;
  String? name;
  String? nativeTokenId;
  String? logoUrl;
  String? wrappedTokenId;
  double? usdValue;

  ChainList({
    this.id,
    this.communityId,
    this.name,
    this.nativeTokenId,
    this.logoUrl,
    this.wrappedTokenId,
    this.usdValue,
  });

  factory ChainList.fromJson(Map<String, dynamic> json) =>
      _$ChainListFromJson(json);

  Map<String, dynamic> toJson() => _$ChainListToJson(this);
}
