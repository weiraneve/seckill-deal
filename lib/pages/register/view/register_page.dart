import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/component/background/arch_background.dart';
import 'package:seckill_deal/pages/register/view_model/register_view_model.dart';
import 'package:seckill_deal/pages/register/view/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size winSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Wrap(children: [
          Stack(children: [
            ArchBackground(height: winSize.height * 0.3),
            const Positioned(top: 20, child: BackButton(color: Colors.white))
          ]),
          Container(
              width: winSize.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: const Stack(
                alignment: Alignment.center,
                children: [RegisterForm()],
              ))
        ]),
      )),
    );
  }
}
