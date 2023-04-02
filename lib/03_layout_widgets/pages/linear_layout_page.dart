import 'package:flutter/material.dart';

class LinearLayoutPage extends StatelessWidget {
  const LinearLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Layout Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(),
            _buildColumn(),
          ],
        ),
      ),
    );
  }

  Widget _buildRow() {
    //  使用Column、Row，需要注意像素溢出的问题
    //  如果子Widget超出了父Widget的尺寸约束限制，则会像素溢出
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.pets,
          size: 20,
          color: Colors.red,
        ),
        Icon(
          Icons.person,
          size: 15,
          color: Colors.tealAccent,
        ),
        Text(
          'Hello',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        )
      ],
    );
  }

  Widget _buildColumn() {
    //  使用SizedBox，使Column在交叉轴上尽可能占用大的尺寸
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.orange,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
