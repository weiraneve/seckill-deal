import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/pages/goods/list/repository/repository.dart';

class GoodsListProvider extends ChangeNotifier {
  String? data = '';
  final GoodsListRepository _repository;

  GoodsListProvider({GoodsListRepository? repository})
      : _repository = repository ?? GoodsListRepository() {
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      _updateState(AuthLoading());
      final response = await _repository.goodsList();
      data = response.data?.first.goods?.goodsName;
      notifyListeners();
    } catch (e) {
      _handleError(e);
    }
  }

  void _updateState(AuthState state) {
    notifyListeners();
  }

  void _handleError(Object e) {
    String errorMessage = "未知错误";
    if (e is DioException) {
      final response = e.response;
      if (e.error is SocketException) {
        errorMessage = '网络错误';
      } else if (response != null) {
        errorMessage = response.data['msg'] ?? errorMessage;
      }
    }
    logger.e(e);
    _updateState(AuthFailure(error: errorMessage));
  }
}
