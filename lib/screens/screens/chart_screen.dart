import 'package:flutter/material.dart';
import '../widgets/candle_chart.dart';
import '../widgets/trade_box.dart';

class ChartScreen extends StatelessWidget {
  final String asset;
  ChartScreen({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(asset)),
      body: Column(
        children: [
          Expanded(child: CandleChart()),
          TradeBox(),
        ],
      ),
    );
  }
}
