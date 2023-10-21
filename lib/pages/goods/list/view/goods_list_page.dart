import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/component/card/goods_card.dart';
import 'package:seckill_deal/pages/goods/list/provider/provider.dart';

class GoodsListPage extends StatefulWidget {
  final Tab tab;

  const GoodsListPage(this.tab, {super.key});

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {

  GoodsListProvider provider = GoodsListProvider();

  @override
  void initState() {
    super.initState();
    provider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => provider,
        child: Consumer<GoodsListProvider>(builder: (context, provider, _) {
          return Scaffold(
            body: ListView(
              children: provider.getGoodsVosList(widget.tab.text).map((goodsVo) {
                return GoodsCard(goodsVo: goodsVo, tabText: widget.tab.text);
              }).toList(),
            ),
          );
        }));
  }
}
