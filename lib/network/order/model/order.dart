import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final String? orderId;
  final String? goodsId;
  final String? goodsName;
  final String? createdAt;

  Order(this.orderId, this.goodsId, this.goodsName, this.createdAt);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
