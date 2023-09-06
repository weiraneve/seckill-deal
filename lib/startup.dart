import 'package:flutter/cupertino.dart';
import 'package:seckill_deal/common/auth/auth.dart';

import 'common/constants.dart';
import 'my_app.dart';
import 'network/config.dart';

void startup() async {
  await initConfig(const String.fromEnvironment(environment));
  await auth.loadAuthToken();
  runApp(const MyApp());
}
