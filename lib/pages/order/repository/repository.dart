import 'package:get/get.dart';
import 'package:seckill_deal/network/Order/api.dart';
import 'package:seckill_deal/network/client.dart';
import 'package:seckill_deal/network/order/model/response.dart';

class OrderRepository {
  final OrderApi _api;

  OrderRepository({OrderApi? orderApi})
      : _api = orderApi ?? Get.put(OrderApi(Get.find<DioClient>().dio));

  Future<OrderResponse> getOrder() => _api.getOrder();
}
