import 'package:flutter/material.dart';
import 'package:seckill_deal/pages/goods/list/view/goods_list_page.dart';
import 'package:seckill_deal/res/strings.dart';

class GoodsTopBarPage extends StatefulWidget {
  const GoodsTopBarPage({super.key});

  @override
  createState() => GoodsTopBarPageState();
}

class GoodsTopBarPageState extends State<GoodsTopBarPage> {
  final List<Tab> _tabs = <Tab>[
    Tab(text: stringRes(R.inProgress)),
    Tab(text: stringRes(R.aboutToStart)),
    Tab(text: stringRes(R.distantFuture)),
    Tab(text: stringRes(R.hasEnded)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            tabs: _tabs,
            isScrollable: true,
            labelColor: Colors.blue,
          ),
        ),
        body: TabBarView(
            children: _tabs
                .map((Tab tab) => Center(child: GoodsListPage(tab)))
                .toList()),
      ),
    );
  }
}
