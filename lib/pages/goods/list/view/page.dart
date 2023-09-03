import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoodsListPage extends StatelessWidget {
  const GoodsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String msg = Get.arguments;
    return Scaffold(
        body: Center(
      child: Text(msg),
    ));
  }
}
