import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/common/logger.dart';
import 'package:seckill_deal/network/goods/list/model/goods_vo.dart';
import 'package:seckill_deal/pages/goods/detail/provider/provider.dart';
import 'package:seckill_deal/res/strings.dart';
import 'package:seckill_deal/utils/date_util.dart';
import 'package:seckill_deal/utils/toast.dart';

class GoodsDetailPage extends StatefulWidget {
  const GoodsDetailPage({super.key});

  @override
  State<GoodsDetailPage> createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  late final GoodsVo goodsVo;

  @override
  void initState() {
    super.initState();
    goodsVo = Get.arguments as GoodsVo;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoodsDetailProvider(goodsVo: goodsVo),
      child: Consumer<GoodsDetailProvider>(
        builder: (context, provider, child) {
          var goods = provider.goodsVo.goods;
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
                          Text(
                              "开始时间: ${formatDateTime(goods?.startTime ?? '')}"),
                          const SizedBox(height: 8),
                          Text("结束时间: ${formatDateTime(goods?.endTime ?? '')}"),
                          const SizedBox(height: 8),
                          Text("库存: ${goods?.goodsStock ?? 0}"),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () async {
                              bool isSuccess = false;
                              try {
                                isSuccess =
                                    await provider.seckill(goods?.id ?? 0);
                              } catch (e) {
                                logger.e(e);
                              } finally {
                                checkSeckillResult(isSuccess);
                              }
                            },
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
        },
      ),
    );
  }

  void checkSeckillResult(bool isSuccess) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isSuccess) {
        Toast.success(context, '恭喜你，秒杀成功!');
      } else {
        Toast.error(context, '对不起，秒杀失败。');
      }
    });
  }
}
