import 'package:json_annotation/json_annotation.dart';

part 'goods.g.dart';

@JsonSerializable()
class Goods {
  final int? id;
  final String? goodsName;
  final String? goodsImg;
  final bool? isUsing;
  final String? goodsTitle;
  final int? goodsPrice;
  final int? goodsStock;
  final String? startTime;
  final String? endTime;
  final String? createdAt;
  final String? updatedAt;

  Goods({
    required this.id,
    required this.goodsName,
    required this.goodsImg,
    required this.isUsing,
    required this.goodsTitle,
    required this.goodsPrice,
    required this.goodsStock,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsToJson(this);
}
