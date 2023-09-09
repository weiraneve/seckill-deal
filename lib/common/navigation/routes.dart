import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:seckill_deal/common/auth/auth_middleware.dart';
import 'package:seckill_deal/pages/goods/detail/view/page.dart';
import 'package:seckill_deal/pages/goods/list/view/goods_navigation_page.dart';
import 'package:seckill_deal/pages/login/view/login_page.dart';
import 'package:seckill_deal/pages/register/view/register_page.dart';

abstract class Routes {
  static const login = '/login';
  static const register = '/register';
  static const goodsNavigation = '/goods_navigation';
  static const goodsDetail = '/goods_detail';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: Routes.goodsNavigation,
      page: () => const GoodsNavigationPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.goodsDetail,
      page: () => GoodsDetailPage(),
    ),
  ];
}
