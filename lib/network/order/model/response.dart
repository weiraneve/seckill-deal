import 'package:json_annotation/json_annotation.dart';
import 'package:seckill_deal/network/order/model/order.dart';

part 'response.g.dart';

@JsonSerializable()
class OrderResponse {
  final int? code;
  final String? msg;
  final List<Order>? data;

  const OrderResponse(
    this.code,
    this.msg,
    this.data,
  );

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
