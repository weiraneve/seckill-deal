import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/component/pure_bottom_bar.dart';
import 'package:seckill_deal/pages/goods/list/provider/provider.dart';
import 'package:seckill_deal/pages/goods/list/view/goods_page.dart';
import 'package:seckill_deal/pages/goods/order/view/order_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final PageController _controller = PageController();
  int position = 0;

  // 禁止 PageView 滑动
  final ScrollPhysics _neverScroll = const NeverScrollableScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoodsListProvider(),
        child: Consumer<GoodsListProvider>(builder: (context, provider, child) {
          return Scaffold(
            body: PageView(
                physics: _neverScroll,
                controller: _controller,
                children: const [
                  GoodsListPage(),
                  OrderPage(),
                ]),
            bottomNavigationBar: _buildBottomNav(context),
          );
        }));
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

  // 点击底部按钮事件，切换页面
  void _onTapBottomNav(int index) {
    _controller.jumpToPage(index);
    position = index;
    if (index == 0) {
    } else {}
  }
}
