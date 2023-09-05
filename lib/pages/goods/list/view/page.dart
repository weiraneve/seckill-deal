import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/pages/goods/list/provider/provider.dart';
import 'package:seckill_deal/res/strings.dart';
import 'package:seckill_deal/utils/auth.dart';
import 'package:seckill_deal/utils/toast.dart';

class GoodsListPage extends StatefulWidget {
  const GoodsListPage({super.key});

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoodsListProvider(),
        child: Consumer<GoodsListProvider>(builder: (context, provider, child) {
          checkLoginState(provider.state);
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<GoodsListProvider>(context, listen: false)
                            .goodsList();
                      },
                      child: const Text('拉取商品数据'),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: ElevatedButton(
                    onPressed: () {
                      auth.logout();
                    },
                    child: Text(stringRes(R.logout)),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  void checkLoginState(AuthState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state is AuthSuccess) {
        Toast.toast(context, '获取数据成功成功! ${state.msg}',
            color: Colors.green, duration: const Duration(seconds: 2));
      } else if (state is AuthFailure) {
        Toast.toast(context, '获取数据失败 : ${state.error}!',
            color: Colors.red, duration: const Duration(seconds: 2));
      }
    });
  }
}
