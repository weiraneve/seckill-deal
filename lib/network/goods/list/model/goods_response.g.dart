// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsResponse _$GoodsResponseFromJson(Map<String, dynamic> json) =>
    GoodsResponse(
      json['code'] as int?,
      json['msg'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => GoodsVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoodsResponseToJson(GoodsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };
