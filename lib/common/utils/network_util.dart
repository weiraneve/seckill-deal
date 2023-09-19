import 'dart:io';

import 'package:dio/dio.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/res/strings.dart';

class NetworkUtil {
  static void handleError(Object e) {
    String errorMessage = stringRes(R.unknownError);
    if (e is DioException) {
      final response = e.response;
      if (e.error is SocketException) {
        errorMessage = stringRes(R.networkError);
      } else if (response != null && response.data is Map) {
        errorMessage = response.data['msg'] ?? errorMessage;
      }
    }
    logger.e(e);
  }

  static String handleErrorMessage(Object e) {
    String errorMessage = stringRes(R.unknownError);
    if (e is DioException) {
      final response = e.response;
      if (e.error is SocketException) {
        errorMessage = stringRes(R.networkError);
      } else if (response != null && response.data is Map) {
        errorMessage = response.data['msg'] ?? errorMessage;
      }
    }
    logger.e(e);
    return errorMessage;
  }
}
