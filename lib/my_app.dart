import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:seckill_deal/common/navigation/routes.dart';
import 'package:seckill_deal/res/strings.dart';

import 'common/di.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: stringRes(R.appName),
      initialRoute: Routes.goodsList,
      initialBinding: GlobalBinding(),
      getPages: AppPages.pages,
      locale: StringResources.locale,
      fallbackLocale: StringResources.fallbackLocale,
      translations: StringResources(),
    );
  }
}
