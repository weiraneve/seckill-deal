import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/network/order/model/order.dart';
import 'package:seckill_deal/pages/Order/repository/repository.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> orders = [];
  final OrderRepository _repository;

  OrderProvider({OrderRepository? repository})
      : _repository = repository ?? OrderRepository() {
    getOrder();
  }

  Future<void> getOrder() async {
    final response = await _repository.getOrder();
    if (response.code == 200) {
      orders = response.data ?? [];
      notifyListeners();
    } else {
      logger.e(response.data);
    }
  }
}
