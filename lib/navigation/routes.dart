import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:seckill_deal/pages/login/login_page.dart';
import 'package:seckill_deal/pages/register/register_page.dart';

abstract class Routes {
  static const login = '/login';
  static const register = '/register';
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
  ];
}
