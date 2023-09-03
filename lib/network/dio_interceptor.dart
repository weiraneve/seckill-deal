import "package:dio/dio.dart";

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

    options.headers.addAll(defaultHeaders);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    int statusCode = err.response?.statusCode ?? 0;
    if (_statusCodeMessages.containsKey(statusCode)) {
      logger.i(_statusCodeMessages[statusCode]);
    } else {
      logger.e(stringRes(R.serverErrorMessage));
    }
    super.onError(err, handler);
  }
}
