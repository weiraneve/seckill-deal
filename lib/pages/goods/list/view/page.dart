import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seckill_deal/res/strings.dart';
import 'package:seckill_deal/utils/auth.dart';

class GoodsListPage extends StatefulWidget {
  const GoodsListPage({super.key});

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String msg = Get.arguments ?? 'void';
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Text(msg),
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
