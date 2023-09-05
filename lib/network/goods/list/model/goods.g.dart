// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goods _$GoodsFromJson(Map<String, dynamic> json) => Goods(
      id: json['id'] as int?,
      goodsName: json['goodsName'] as String?,
      goodsImg: json['goodsImg'] as String?,
      isUsing: json['isUsing'] as bool?,
      goodsTitle: json['goodsTitle'] as String?,
      goodsPrice: json['goodsPrice'] as int?,
      goodsStock: json['goodsStock'] as int?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'id': instance.id,
      'goodsName': instance.goodsName,
      'goodsImg': instance.goodsImg,
      'isUsing': instance.isUsing,
      'goodsTitle': instance.goodsTitle,
      'goodsPrice': instance.goodsPrice,
      'goodsStock': instance.goodsStock,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
