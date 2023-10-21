import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/common/utils/date_util.dart';
import 'package:seckill_deal/pages/order/view_model/order_view_model.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<StatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  OrderViewModel viewModel = OrderViewModel();

  @override
  void initState() {
    viewModel.getOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<OrderViewModel>(
          builder: (context, viewModel, _) {
            return ListView(
              children: viewModel.orders.map((order) {
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
