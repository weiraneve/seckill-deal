import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/component/background/arch_background.dart';
import 'package:seckill_deal/pages/login/provider/provider.dart';
import 'package:seckill_deal/pages/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size winSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Wrap(children: [
          Stack(children: [ArchBackground(height: winSize.height * 0.3)]),
          Container(
              width: winSize.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: const Stack(
                alignment: Alignment.center,
                children: [LoginFrom()],
              ))
        ]),
      )),
    );
  }
}
