// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsVo _$GoodsVoFromJson(Map<String, dynamic> json) => GoodsVo(
      json['remainSeconds'] as int?,
      json['stockCount'] as int?,
      json['goods'] == null
          ? null
          : Goods.fromJson(json['goods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoodsVoToJson(GoodsVo instance) => <String, dynamic>{
      'remainSeconds': instance.remainSeconds,
      'stockCount': instance.stockCount,
      'goods': instance.goods,
    };
