import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:seckill_deal/common/auth/auth.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!auth.isAuthenticated) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
