import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/utils/date_util.dart';
import 'package:seckill_deal/common/utils/toast.dart';
import 'package:seckill_deal/pages/goods/detail/provider/provider.dart';
import 'package:seckill_deal/res/strings.dart';

class GoodsDetailPage extends StatelessWidget {
  const GoodsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoodsDetailProvider(Get.arguments),
      child: _GoodsDetailPageBody(),
    );
  }
}

class _GoodsDetailPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<GoodsDetailProvider>();
    _checkSeckillState(context, provider.state);
    var goods = provider.goods;
    return Scaffold(
      appBar: AppBar(
        title: Text(stringRes(R.goodsDetail)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(
              goods?.goodsImg ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          goods?.goodsName ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text("价格: ¥${goods?.goodsPrice ?? 0}"),
                    const SizedBox(height: 8),
                    Text("开始时间: ${formatDateTime(goods?.startTime ?? '')}"),
                    const SizedBox(height: 8),
                    Text("结束时间: ${formatDateTime(goods?.endTime ?? '')}"),
                    const SizedBox(height: 8),
                    Text("库存: ${provider.stockCount ?? 0}"),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _seckill(context, goods?.id ?? 0),
                      child: Text(stringRes(R.seckill)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _seckill(BuildContext context, int goodsId) {
    context.read<GoodsDetailProvider>().seckill(goodsId);
  }

  void _checkSeckillState(BuildContext context, AuthState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state is AuthSuccess) {
        Toast.success(context, stringRes(R.successful));
      } else if (state is AuthFailure) {
        Toast.error(context, '${stringRes(R.fail)}: ${state.error}!');
      }
    });
  }
}
