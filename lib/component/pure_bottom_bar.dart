import 'package:flutter/material.dart';
import 'package:seckill_deal/res/strings.dart';

typedef IndexTapCallback = void Function(int);

class PureBottomBar extends StatefulWidget {
  final int initPosition;

  final IndexTapCallback? onItemTap;

  const PureBottomBar({super.key, this.onItemTap, this.initPosition = 0});

  @override
  State<PureBottomBar> createState() => _PureBottomBarState();
}

class _PureBottomBarState extends State<PureBottomBar> {
  List<String> get bottomBar => [stringRes(R.goodsList), stringRes(R.orderDetail)];

  List<IconData> get bottomBarIcon =>
      const [Icons.shopping_cart, Icons.fact_check];
  int _position = 0;

  @override
  void initState() {
    super.initState();
    _position = widget.initPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        BottomNavigationBar(
          onTap: (position) {
            _position = position;
            widget.onItemTap?.call(_position);
            setState(() {});
          },
          currentIndex: _position,
          elevation: 3,
          type: BottomNavigationBarType.fixed,
          iconSize: 22,
          selectedItemColor: Theme.of(context).primaryColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: bottomBar
              .asMap()
              .keys
              .map((index) => BottomNavigationBarItem(
                  label: bottomBar[index], icon: Icon(bottomBarIcon[index])))
              .toList(),
        ),
      ],
    );
  }
}
