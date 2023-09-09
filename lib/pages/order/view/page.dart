import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/pages/order/provider/provider.dart';
import 'package:seckill_deal/res/strings.dart';
import 'package:seckill_deal/utils/date_util.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stringRes(R.orderPageTitle)),
      ),
      body: ChangeNotifierProvider(
        create: (context) => OrderProvider(),
        child: Consumer<OrderProvider>(
          builder: (context, provider, child) {
            return ListView(
              children: provider.orders.map((order) {
                return Card(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Column(children: [
                      ListTile(
                        title: Text('商品名: ${order.goodsName}'),
                        subtitle: Text(
                            '创建时间: ${formatDateTime(order.createdAt ?? '')}'),
                      )
                    ]);
                  }),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
