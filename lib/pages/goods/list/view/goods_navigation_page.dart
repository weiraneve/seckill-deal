import 'package:flutter/material.dart';
import 'package:seckill_deal/common/auth/auth.dart';
import 'package:seckill_deal/component/pure_bottom_bar.dart';
import 'package:seckill_deal/pages/goods/list/view/goods_top_bar_page.dart';
import 'package:seckill_deal/pages/order/view/page.dart';
import 'package:seckill_deal/res/strings.dart';

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
      appBar: AppBar(),
      body: PageView(
        controller: _controller,
        physics: _neverScroll,
        children: const [
          GoodsTopBarPage(),
          OrderPage(),
        ],
      ),
      drawer: _buildDrawer(),
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

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(''),
          ),
          ListTile(
            title: Text(stringRes(R.updatePassword)),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(stringRes(R.updatePassword)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: stringRes(R.oldPassword)),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: stringRes(R.newPassword)),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: stringRes(R.confirmPassword)),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(stringRes(R.cancel)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(stringRes(R.summit)),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: Text(stringRes(R.logout)),
            onTap: () {
              auth.logout();
            },
          ),
        ],
      ),
    );
  }

  void _onTapBottomNav(int index) {
    _controller.jumpToPage(index);
    position = index;
  }
}
