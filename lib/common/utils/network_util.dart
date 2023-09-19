import 'dart:io';

import 'package:dio/dio.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/res/strings.dart';

class NetworkUtil {
  static String _getErrorMessage(Object e) {
    String errorMessage = stringRes(R.unknownError);
    if (e is DioException) {
      final response = e.response;
      if (e.error is SocketException) {
        errorMessage = stringRes(R.networkError);
      } else if (response != null && response.data is Map) {
        errorMessage = response.data['msg'] ?? errorMessage;
      }
    }
    return errorMessage;
  }

  static void handleError(Object e) {
    _getErrorMessage(e);
    logger.e(e);
  }

  static String handleErrorMessage(Object e) {
    String errorMessage = _getErrorMessage(e);
    logger.e(e);
    return errorMessage;
  }
}

