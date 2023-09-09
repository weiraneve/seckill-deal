import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/network/order/model/order.dart';
import 'package:seckill_deal/pages/Order/repository/repository.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> orders = [];
  final OrderRepository _repository;

  OrderProvider({OrderRepository? repository})
      : _repository = repository ?? OrderRepository();

  Future<void> getOrder() async {
    try {
      final response = await _repository.getOrder();
      orders = response.data ?? [];
    } catch (e) {
      _handleError(e);
    }
  }

  void _handleError(Object e) {
    String errorMessage = "未知错误";
    if (e is DioException) {
      final response = e.response;
      if (e.error is SocketException) {
        errorMessage = '网络错误';
      } else if (response != null && response.data is Map) {
        errorMessage = response.data['msg'] ?? errorMessage;
      }
    }
    logger.e(e);
  }
}
