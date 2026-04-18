import 'package:flutter/material.dart';

class TradeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("BUY BTC near 75,100",
              style: TextStyle(color: Colors.green, fontSize: 16)),
          Text("Confidence: 72% | Risk: Medium"),
          SizedBox(height: 5),
          Text("Reason: Uptrend + RSI strong"),
          SizedBox(height: 5),
          Text("SL: 73,800 | Target: 77,000"),
          SizedBox(height: 5),
          Text("Educational Purpose Only",
              style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
