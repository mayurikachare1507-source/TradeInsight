import 'package:flutter/material.dart';
import 'dart:math';

class Candle {
  final double open, high, low, close;
  Candle(this.open, this.high, this.low, this.close);
}

class CandleChart extends StatelessWidget {
  final List<Candle> data = List.generate(
    60,
    (i) {
      double base = 100 + Random().nextDouble() * 50;
      return Candle(base, base + 10, base - 10, base + Random().nextDouble() * 5);
    },
  );

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChartPainter(data),
      size: Size.infinite,
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<Candle> candles;
  ChartPainter(this.candles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    double width = size.width / candles.length;

    double maxPrice = candles.map((c) => c.high).reduce(max);
    double minPrice = candles.map((c) => c.low).reduce(min);

    double scale = size.height / (maxPrice - minPrice);

    for (int i = 0; i < candles.length; i++) {
      final c = candles[i];
      double x = i * width;

      double openY = (maxPrice - c.open) * scale;
      double closeY = (maxPrice - c.close) * scale;
      double highY = (maxPrice - c.high) * scale;
      double lowY = (maxPrice - c.low) * scale;

      paint.color = c.close > c.open ? Colors.green : Colors.red;

      canvas.drawLine(
        Offset(x + width / 2, highY),
        Offset(x + width / 2, lowY),
        paint,
      );

      canvas.drawRect(
        Rect.fromLTRB(x, openY, x + width, closeY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => true;
}
