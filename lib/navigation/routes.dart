import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/home_page.dart';

abstract class Routes {
  static const home = '/home';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
  ];
}
