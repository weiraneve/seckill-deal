import 'package:json_annotation/json_annotation.dart';
import 'package:seckill_deal/network/goods/list/model/goods_vo.dart';

part 'goods_response.g.dart';

@JsonSerializable()
class GoodsResponse {
  final int? code;
  final String? msg;
  final List<GoodsVo>? data;

  const GoodsResponse(this.code, this.msg, this.data);

  factory GoodsResponse.fromJson(Map<String, dynamic> json) =>
      _$GoodsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsResponseToJson(this);
}
