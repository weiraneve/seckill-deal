import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/component/card/goods_card.dart';
import 'package:seckill_deal/pages/goods/list/view_model/goods_list_view_model.dart';

class GoodsListPage extends StatefulWidget {
  final Tab tab;

  const GoodsListPage(this.tab, {super.key});

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  GoodsListViewModel viewModel = GoodsListViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<GoodsListViewModel>(builder: (context, viewModel, _) {
          return Scaffold(
            body: ListView(
              children:
                  viewModel.getGoodsVosList(widget.tab.text).map((goodsVo) {
                return GoodsCard(goodsVo: goodsVo, tabText: widget.tab.text);
              }).toList(),
            ),
          );
        }));
  }
}
