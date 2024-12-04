import 'package:flutter/material.dart';
import 'package:tradeable_learn/tradeable_learn.dart';

class AxisPageList extends StatelessWidget {
  const AxisPageList({super.key});

  @override
  Widget build(BuildContext context) {
    return TradeableLearnContainer(
        learnBtnTopPos: 80,
        child: Scaffold(
          appBar: AppBar(
              //backgroundColor: Colors.red,
              ),
          body: SafeArea(
              child: MaterialButton(
            onPressed: () {},
            child: const Text("Click me"),
          )),
        ));
  }
}
