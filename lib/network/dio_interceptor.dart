import "package:dio/dio.dart";
import "package:seckill_deal/common/auth/auth.dart";

import '../common/log/logger.dart';
import "../res/strings.dart";

class DioInterceptor extends Interceptor {
  final Map<int, String> _statusCodeMessages = {
    401: "Unauthorized",
    403: "Forbidden",
  };

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[_authorization] = "Bearer ${auth.authToken}";
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    int statusCode = err.response?.statusCode ?? 0;
    if (statusCode == 401 || statusCode == 403) {
      auth.logout();
    }
    if (_statusCodeMessages.containsKey(statusCode)) {
      logger.i(_statusCodeMessages[statusCode]);
    } else {
      switch (err.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.cancel:
        case DioExceptionType.badResponse:
          logger.e(stringRes(R.serverError));
        default:
          logger.e(stringRes(R.otherError));
          super.onError(err, handler);
      }
    }
  }
}

const _authorization = 'Authorization';
