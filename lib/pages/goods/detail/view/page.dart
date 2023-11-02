import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:seckill_deal/common/auth/state.dart';
import 'package:seckill_deal/common/utils/date_util.dart';
import 'package:seckill_deal/common/utils/toast.dart';
import 'package:seckill_deal/pages/goods/detail/view_model/goods_detail_view_model.dart';
import 'package:seckill_deal/res/strings.dart';

class GoodsDetailPage extends StatefulWidget {
  const GoodsDetailPage({super.key});

  @override
  State<GoodsDetailPage> createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  late GoodsDetailViewModel viewModel = GoodsDetailViewModel(Get.arguments);

  @override
  void initState() {
    viewModel.getDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _checkSeckillState(context, viewModel.state);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
          appBar: AppBar(
            title: Text(stringRes(R.goodsDetail)),
          ),
          body: Consumer<GoodsDetailViewModel>(
            builder: (context, viewModel, _) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    (viewModel.goods?.goodsImg?.isEmpty ?? true)
                        ? const SizedBox.shrink()
                        : Image.network(
                            viewModel.goods?.goodsImg ?? '',
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
                                  viewModel.goods?.goodsName ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text("价格: ¥${viewModel.goods?.goodsPrice ?? 0}"),
                            const SizedBox(height: 8),
                            Text(
                                "开始时间: ${formatDateTime(viewModel.goods?.startTime ?? '')}"),
                            const SizedBox(height: 8),
                            Text(
                                "结束时间: ${formatDateTime(viewModel.goods?.endTime ?? '')}"),
                            const SizedBox(height: 8),
                            Text("库存: ${viewModel.stockCount ?? 0}"),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => viewModel.seckill(),
                              child: Text(stringRes(R.seckill)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }

  void _checkSeckillState(BuildContext context, AuthState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state is AuthSuccess) {
        showToast(stringRes(R.successful));
      } else if (state is AuthFailure) {
        showToast('${stringRes(R.fail)}: ${state.error}!');
      }
    });
  }
}
