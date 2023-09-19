import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/utils/network_util.dart';
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
    try {
      final response = await _repository.getOrder();
      orders = response.data ?? [];
      notifyListeners();
    } catch (e) {
      NetworkUtil.handleError(e);
    }
  }
}
