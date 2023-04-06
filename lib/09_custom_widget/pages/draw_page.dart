import 'dart:math';

import 'package:flutter/material.dart';

class DrawPage extends StatelessWidget {
  const DrawPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw Page'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: GobangWidet(),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("刷新"),
          ),
        ],
      ),
    );
  }
}

class GobangWidet extends StatelessWidget {
  const GobangWidet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final maxWidth = constraints.maxWidth;
      final maxHeight = constraints.maxHeight;
      final dimension = min(maxWidth, maxHeight);
      //  使用RepaintBoundary，防止意外重绘
      return RepaintBoundary(
        //  CustomPaint：结合CustomPainter实现绘制
        child: CustomPaint(
          size: Size.square(dimension),
          painter: GobangPainter(),
        ),
      );
    });
  }
}

class GobangPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //  Offset重载了&
    final rect = Offset.zero & size;
    _drawChessboard(canvas, rect);
    _drawPieces(canvas, rect);
  }

  void _drawChessboard(Canvas canvas, Rect rect) {
    debugPrint('rect = $rect');
    //  定义Paint
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFDCC48C);
    //  画棋盘
    canvas.drawRect(rect, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black38
      ..strokeWidth = 1.0;

    //  画横线
    for (int i = 0; i <= 15; i++) {
      double dy = rect.top + rect.height / 15 * i;
      canvas.drawLine(
        Offset(rect.left, dy),
        Offset(rect.right, dy),
        paint,
      );
    }
    //  画竖线
    for (int i = 0; i <= 15; i++) {
      double dx = rect.left + rect.width / 15 * i;
      canvas.drawLine(
        Offset(dx, rect.top),
        Offset(dx, rect.bottom),
        paint,
      );
    }
  }

  void _drawPieces(Canvas canvas, Rect rect) {
    double itemWidth = rect.width / 15;
    double itemHeight = rect.height / 15;

    final paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(rect.center.dx - itemWidth / 2, rect.center.dy - itemHeight / 2),
      min(itemWidth, itemHeight) / 2,
      paint,
    );

    paint.color = Colors.black;
    canvas.drawCircle(
      Offset(rect.center.dx + itemWidth / 2, rect.center.dy + itemHeight / 2),
      min(itemWidth, itemHeight) / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
