import 'package:flutter/material.dart';
import 'package:seckill_deal/common/auth/auth.dart';
import 'package:seckill_deal/res/strings.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Text('订单页'),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: ElevatedButton(
              onPressed: () {
                auth.logout();
              },
              child: Text(stringRes(R.logout)),
            ),
          ),
        ],
      ),
    );
  }
}
