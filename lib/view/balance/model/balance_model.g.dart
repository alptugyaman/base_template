// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
      totalUsdValue: (json['total_usd_value'] as num?)?.toDouble(),
      chainList: (json['chain_list'] as List<dynamic>?)
          ?.map((e) => ChainList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'total_usd_value': instance.totalUsdValue,
      'chain_list': instance.chainList,
    };

ChainList _$ChainListFromJson(Map<String, dynamic> json) => ChainList(
      id: json['id'] as String?,
      communityId: json['community_id'] as int?,
      name: json['name'] as String?,
      nativeTokenId: json['native_token_id'] as String?,
      logoUrl: json['logo_url'] as String?,
      wrappedTokenId: json['wrapped_token_id'] as String?,
      usdValue: (json['usd_value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ChainListToJson(ChainList instance) => <String, dynamic>{
      'id': instance.id,
      'community_id': instance.communityId,
      'name': instance.name,
      'native_token_id': instance.nativeTokenId,
      'logo_url': instance.logoUrl,
      'wrapped_token_id': instance.wrappedTokenId,
      'usd_value': instance.usdValue,
    };
