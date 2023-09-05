import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/pages/goods/list/repository/repository.dart';

class GoodsListProvider extends ChangeNotifier {
  final GoodsListRepository _repository;
  AuthState _state = const AuthInitial();

  GoodsListProvider({GoodsListRepository? repository})
      : _repository = repository ?? GoodsListRepository();

  AuthState get state => _state;

  Future<void> goodsList() async {
    try {
      _updateState(AuthLoading());
      final response = await _repository.goodsList();
      _updateState(AuthSuccess(response.data?.first.goods?.goodsName));
    } catch (e) {
      _handleError(e);
    }
  }

  void _updateState(AuthState state) {
    _state = state;
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
