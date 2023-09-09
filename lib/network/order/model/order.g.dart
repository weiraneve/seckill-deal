// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['orderId'] as String?,
      json['goodsId'] as String?,
      json['goodsName'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'goodsId': instance.goodsId,
      'goodsName': instance.goodsName,
      'createdAt': instance.createdAt,
    };
