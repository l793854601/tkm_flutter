import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBasicAligns(),
            _buildCenter(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicAligns() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          color: Colors.purple[300],
          child: const Align(
            //  对齐方式
            alignment: Alignment.center,
            child: FlutterLogo(size: 60),
          ),
        ),
        Container(
          color: Colors.red[300],
          child: const Align(
            //  widthFactor*子Widget的宽度确定Align本身的宽度
            widthFactor: 2,
            //  heightFactor*子Widget的高度确定Align本身的高度
            heightFactor: 2,
            //  相对于Align中心点的偏移量
            alignment: Alignment(0, 0),
            child: FlutterLogo(size: 60),
          ),
        ),
        Container(
          color: Colors.yellow[300],
          child: const Align(
            widthFactor: 2,
            heightFactor: 2,
            //  相对于Align左上角位置的偏移量
            alignment: FractionalOffset(0.5, 0.5),
            child: FlutterLogo(size: 60),
          ),
        ),
      ],
    );
  }

  Widget _buildCenter() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          color: Colors.cyan[500],
          //  Center继承自Align
          //  Align的alignment默认为center
          child: const Center(
            child: Text('hello'),
          ),
        ),
        Container(
          width: 120,
          height: 120,
          color: Colors.tealAccent[100],
          //  使用alignment达到Center的效果
          //  如果设置了alignment，最终会生成Align
          alignment: Alignment.center,
          child: const Text('hello'),
        ),
      ],
    );
  }
}
