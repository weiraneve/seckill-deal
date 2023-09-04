import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:seckill_deal/pages/goods/list/view/page.dart';
import 'package:seckill_deal/pages/login/view/login_page.dart';
import 'package:seckill_deal/pages/register/view/register_page.dart';

abstract class Routes {
  static const login = '/login';
  static const register = '/register';
  static const goodsList = '/goods_list';
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
      name: Routes.goodsList,
      page: () => const GoodsListPage(),
    ),
  ];
}
