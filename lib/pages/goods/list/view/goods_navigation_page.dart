import 'package:flutter/material.dart';
import 'package:seckill_deal/component/pure_bottom_bar.dart';
import 'package:seckill_deal/pages/goods/list/view/goods_top_bar_page.dart';
import 'package:seckill_deal/pages/order/view/order_page.dart';

class GoodsNavigationPage extends StatefulWidget {
  const GoodsNavigationPage({super.key});

  @override
  State<GoodsNavigationPage> createState() => _GoodsNavigationPageState();
}

class _GoodsNavigationPageState extends State<GoodsNavigationPage> {
  final PageController _controller = PageController();
  int position = 0;
  final ScrollPhysics _neverScroll = const NeverScrollableScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: _neverScroll,
        children: const [
          GoodsTopBarPage(),
          OrderPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Stack(
      children: [
        PureBottomBar(
          initPosition: position,
          onItemTap: _onTapBottomNav,
        ),
      ],
    );
  }

  void _onTapBottomNav(int index) {
    _controller.jumpToPage(index);
    position = index;
  }
}
