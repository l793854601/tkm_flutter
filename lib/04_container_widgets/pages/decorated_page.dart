import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecoratedPage extends StatelessWidget {
  const DecoratedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decorated Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildContainer(),
            _buildDecoratedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      //  Container内部的decoration不为null，则会生成DecoratedBox
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.orange.shade700,
          ],
        ),
        //背景渐变
        borderRadius: BorderRadius.circular(3.0),
        //3像素圆角
        boxShadow: const [
          //阴影
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDecoratedBox() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.black87, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: const Text('123'),
      ),
    );
  }
}
