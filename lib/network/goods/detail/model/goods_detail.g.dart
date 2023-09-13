// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsDetail _$GoodsDetailFromJson(Map<String, dynamic> json) => GoodsDetail(
      json['remainSeconds'] as int?,
      json['stockCount'] as int?,
      json['goods'] == null
          ? null
          : Goods.fromJson(json['goods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoodsDetailToJson(GoodsDetail instance) =>
    <String, dynamic>{
      'remainSeconds': instance.remainSeconds,
      'stockCount': instance.stockCount,
      'goods': instance.goods,
    };
