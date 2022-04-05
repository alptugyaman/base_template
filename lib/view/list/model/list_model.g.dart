// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChainList _$ChainListFromJson(Map<String, dynamic> json) => ChainList(
      id: json['id'] as String,
      communityId: json['community_id'] as int,
      name: json['name'] as String,
      nativeTokenId: json['native_token_id'] as String,
      logoUrl: json['logo_url'] as String,
      wrappedTokenId: json['wrapped_token_id'] as String,
      usdValue: (json['usd_value'] as num).toDouble(),
    );
