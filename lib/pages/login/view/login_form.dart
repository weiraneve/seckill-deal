import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/pages/login/provider/provider.dart';

import '../../../component/input/icon_input.dart';
import '../../../navigation/routes.dart';
import '../../../res/strings.dart';
import '../../../utils/toast.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _phoneNumController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      checkLoginState(provider.state);
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            stringRes(R.loginTitle),
            style: const TextStyle(fontSize: 25),
          ),
          IconInput(
            icon: Icons.person_outline,
            textFiled: TextField(
              controller: _phoneNumController,
              keyboardType: TextInputType.number,
              maxLength: 11,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: stringRes(R.loginHint),
                hintStyle: const TextStyle(color: Colors.grey),
                counterText: '',
              ),
            ),
          ),
          IconInput(
            icon: Icons.lock_outline,
            textFiled: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: stringRes(R.passwordHint),
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          _buildLoginButton(),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.register);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                stringRes(R.needRegister),
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue),
              ),
            ),
          ),
        ],
      );
    });
  }

  void checkLoginState(AuthState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state is AuthSuccess) {
        Toast.success(context, '登录成功!');
        Get.toNamed(Routes.goodsList);
      } else if (state is AuthFailure) {
        Toast.error(context, '登录失败 : ${state.error}!');
      }
    });
  }

  Future<void> _doLogin() async {
    if (_preValidate(_phoneNumController.text, _passwordController.text)) {
      Provider.of<LoginProvider>(context, listen: false)
          .login(_phoneNumController.text, _passwordController.text);
    }
  }

  Widget _buildLoginButton() {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: Colors.blue,
          ),
          onPressed: () => {_doLogin()},
          child: Text(stringRes(R.login),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ));
  }

  bool _preValidate(String phoneNum, String password) {
    if (phoneNum.isEmpty || password.isEmpty) {
      Toast.warning(context, stringRes(R.loginEmptyError));
      return false;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNum) || phoneNum.length != 11) {
      Toast.warning(context, stringRes(R.phoneFormatError));
      return false;
    }
    return true;
  }
}
