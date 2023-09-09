import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/component/card/goods_card.dart';
import 'package:seckill_deal/network/goods/list/model/goods_vo.dart';
import 'package:seckill_deal/pages/goods/list/provider/provider.dart';
import 'package:seckill_deal/res/strings.dart';

class GoodsListPage extends StatefulWidget {
  final Tab tab;

  const GoodsListPage(this.tab, {super.key});

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoodsListProvider(),
        child: Consumer<GoodsListProvider>(builder: (context, provider, child) {
          return Scaffold(
            body: ListView(
              children: provider.goodsVos?.map((goodsVo) {
                    return convert(goodsVo);
                    // return GoodsCard(goodsVo: goodsVo);
                  }).toList() ??
                  [],
            ),
          );
        }));
  }

  Widget convert(GoodsVo? goodsVo) {
    DateTime startTime = DateTime.parse(goodsVo?.goods?.startTime ?? '');
    DateTime endTime = DateTime.parse(goodsVo?.goods?.endTime ?? '');
    DateTime now = DateTime.now();
    Duration timeUntilStart = startTime.difference(now);
    Duration timeUntilEnd = endTime.difference(now);

    String tabText = widget.tab.text ?? '';
    if (timeUntilStart.isNegative &&
        timeUntilEnd.isNegative &&
        tabText == stringRes(R.hasEnded)) {
      return GoodsCard(goodsVo: goodsVo);
    } else if (timeUntilStart.isNegative &&
        !timeUntilEnd.isNegative &&
        tabText == stringRes(R.inProgress)) {
      return GoodsCard(goodsVo: goodsVo);
    } else if (!timeUntilStart.isNegative &&
        timeUntilStart.inHours < 24 &&
        tabText == stringRes(R.aboutToStart)) {
      return GoodsCard(goodsVo: goodsVo);
    } else if (!timeUntilStart.isNegative &&
        timeUntilStart.inHours >= 24 &&
        tabText == stringRes(R.distantFuture)) {
      return GoodsCard(goodsVo: goodsVo);
    }
    return const Text('');
  }
}
