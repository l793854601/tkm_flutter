import 'dart:math';

import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget {
  const TransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTransform(),
            _buildTranslateTransform(),
            _buildRotateTransform(),
            _buildRotatedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildTransform() {
    return Container(
      color: Colors.black87,
      child: Transform(
        alignment: Alignment.bottomRight,
        transform: Matrix4.skewY(0.3),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.deepOrange,
          child: const Text('Apartment for rent!'),
        ),
      ),
    );
  }

  Widget _buildTranslateTransform() {
    return Container(
      color: Colors.red,
      child: Transform.translate(
        offset: const Offset(10, 20),
        child: const Text("Hello world"),
      ),
    );
  }

  Widget _buildRotateTransform() {
    return Container(
      color: Colors.cyan,
      child: Transform.rotate(
        angle: pi / 2,
        child: const Text("Hello world"),
      ),
    );
  }

  Widget _buildRotatedBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //  区别于Transform，RotatedBox会作用于Layout，也就是会根据自身结果占用相应的位置
          child: RotatedBox(
            //  旋转1/4
            quarterTurns: 1,
            child: Text("Hello world"),
          ),
        ),
        Text(
          "你好",
          style: TextStyle(
            color: Colors.green,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
