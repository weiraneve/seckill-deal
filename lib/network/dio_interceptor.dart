import "package:dio/dio.dart";
import "package:seckill_deal/utils/auth.dart";

import "../common/logger.dart";
import "../res/strings.dart";

class DioInterceptor extends Interceptor {
  final Map<int, String> _statusCodeMessages = {
    400: "Bad Request",
    401: "Unauthorized",
    403: "Forbidden",
    404: "Not Found",
  };

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final defaultHeaders = {
      "Content-Type": "application/json",
      "Custom-Key": "Custom",
    };

    if (auth.isAuthenticated) {
      String token = auth.authToken;
      defaultHeaders[_authorization] = "Bearer $token";
    }

    options.headers.addAll(defaultHeaders);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    int statusCode = err.response?.statusCode ?? 0;
    if (_statusCodeMessages.containsKey(statusCode)) {
      logger.i(_statusCodeMessages[statusCode]);
      if (statusCode == 401 || statusCode == 403) {
        auth.logout();
      }
    } else {
      logger.e(stringRes(R.serverErrorMessage));
    }
    super.onError(err, handler);
  }
}

const _authorization = 'Authorization';
