import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/auth.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/network/login/model/request.dart';
import 'package:seckill_deal/pages/login/repository/repository.dart';
import 'package:seckill_deal/utils/token_storage.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository _repository;
  AuthState _state = const AuthInitial();

  LoginProvider({LoginRepository? repository})
      : _repository = repository ?? LoginRepository();

  AuthState get state => _state;

  Future<void> login(String mobile, String password) async {
    try {
      _updateState(AuthLoading());
      final response = await _repository.login(LoginRequest(mobile, password));
      await tokenStorage.set(response.data ?? '');
      await auth.loadAuthToken();
      _updateState(AuthSuccess(response.msg));
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
      } else if (response != null && response.data is Map) {
        errorMessage = response.data['msg'] ?? errorMessage;
      }
    }
    logger.e(e);
    _updateState(AuthFailure(error: errorMessage));
  }
}
