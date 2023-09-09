import 'package:flutter/material.dart';
import 'package:seckill_deal/network/goods/list/model/goods_vo.dart';
import 'package:seckill_deal/res/strings.dart';

class GoodsCard extends StatelessWidget {
  final GoodsVo? goodsVo;

  const GoodsCard({super.key, required this.goodsVo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 270,
        child: Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Image.network(goodsVo?.goods?.goodsImg ?? '',
                      width: double.infinity, height: 180, fit: BoxFit.cover),
                  ListTile(
                    title: Text(goodsVo?.goods?.goodsName ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(goodsVo?.goods?.goodsTitle ?? ''),
                        Text((goodsVo?.goods?.goodsPrice ?? 0).toString()),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text(stringRes(R.enterSeckillDetail)),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
