import 'package:flutter/cupertino.dart';

import 'common/constants.dart';
import 'my_app.dart';
import 'network/config.dart';

void startup() async {
  await initConfig(const String.fromEnvironment(environment));
  runApp(const MyApp());
}
