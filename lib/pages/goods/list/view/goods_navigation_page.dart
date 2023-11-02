import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/common/auth/auth.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/utils/toast.dart';
import 'package:seckill_deal/component/pure_bottom_bar.dart';
import 'package:seckill_deal/pages/goods/list/view/goods_top_bar_page.dart';
import 'package:seckill_deal/pages/login/view_model/update_password_view_model.dart';
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
    return ChangeNotifierProvider(
      create: (context) => UpdatePasswordViewModel(),
      child: Consumer<UpdatePasswordViewModel>(
          builder: (context, viewModel, child) {
        checkUpdatePasswordState(viewModel.state);
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
                              onChanged: (value) =>
                                  viewModel.oldPassword = value,
                              decoration: InputDecoration(
                                  labelText: stringRes(R.oldPassword)),
                            ),
                            TextField(
                              obscureText: true,
                              onChanged: (value) =>
                                  viewModel.newPassword = value,
                              decoration: InputDecoration(
                                  labelText: stringRes(R.newPassword)),
                            ),
                            TextField(
                              obscureText: true,
                              onChanged: (value) =>
                                  viewModel.confirmNewPassword = value,
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
                              viewModel.updatePassword();
                              Navigator.pop(context);
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
      }),
    );
  }

  void checkUpdatePasswordState(AuthState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state is AuthSuccess) {
        showToast(stringRes(R.updateSuccess));
      } else if (state is AuthFailure) {
        showToast('${stringRes(R.fail)} : ${state.error}!');
      }
    });
  }

  void _onTapBottomNav(int index) {
    _controller.jumpToPage(index);
    position = index;
  }
}
