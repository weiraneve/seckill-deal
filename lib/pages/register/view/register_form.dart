import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/common/auth/state.dart';

import '../../../component/input/icon_input.dart';
import '../../../navigation/routes.dart';
import '../../../res/strings.dart';
import '../../../utils/toast.dart';
import '../provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _phoneNumController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, provider, child) {
      checkRegisterState(provider.state);
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            stringRes(R.registerTitle),
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
                hintText: stringRes(R.registerHint),
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
          IconInput(
            icon: Icons.lock_outline,
            textFiled: TextField(
              obscureText: true,
              controller: _passwordConfirmController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: stringRes(R.passwordConfirmHint),
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          _buildRegisterButton(),
        ],
      );
    });
  }

  void checkRegisterState(AuthState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state is AuthSuccess) {
        Toast.success(context, '获取成功!');
        Get.toNamed(Routes.goodsList, arguments: state.msg);
      } else if (state is AuthFailure) {
        Toast.error(context, '获取失败 : ${state.error}!');
      }
    });
  }

  void _doRegister() {
    if (_preValidate(_phoneNumController.text, _passwordController.text,
        _passwordConfirmController.text)) {
      Provider.of<RegisterProvider>(context, listen: false)
          .register(_phoneNumController.text, _passwordController.text);
    }
  }

  Widget _buildRegisterButton() {
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
          onPressed: () => {_doRegister()},
          child: Text(stringRes(R.register),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ));
  }

  bool _preValidate(String phoneNum, String password, String confirmPassword) {
    if (phoneNum.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Toast.warning(context, stringRes(R.registerEmptyError));
      return false;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNum) ||
        phoneNum.length != 11 ||
        password != confirmPassword) {
      Toast.warning(context, stringRes(R.registerFormatError));
      return false;
    }
    return true;
  }
}
