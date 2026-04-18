import 'package:flutter/material.dart';
import 'chart_screen.dart';

class HomeScreen extends StatelessWidget {
  final markets = [
    {"name": "Bitcoin", "price": "75000"},
    {"name": "Gold", "price": "1980"},
    {"name": "Forex", "price": "1.08"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TradeInsight")),
      body: ListView.builder(
        itemCount: markets.length,
        itemBuilder: (_, i) {
          final m = markets[i];
          return ListTile(
            title: Text(m["name"]!),
            subtitle: Text("Price: ${m["price"]}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChartScreen(asset: m["name"]!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
