import 'package:seckill_deal/common/log/logger.dart';
import 'package:seckill_deal/common/view_model/base_view_model.dart';
import 'package:seckill_deal/network/order/model/order.dart';
import 'package:seckill_deal/pages/Order/repository/repository.dart';

class OrderViewModel extends BaseViewModel {
  List<Order> orders = [];
  final OrderRepository _repository;

  OrderViewModel({OrderRepository? repository})
      : _repository = repository ?? OrderRepository();

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
