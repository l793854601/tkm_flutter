import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  final _avatar = const Image(
    image: AssetImage('assets/images/avatar.jpeg'),
    width: 120,
  );

  const ClipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clip Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCircleClipWidgets(),
            _buildCustomClip(),
          ],
        ),
      ),
    );
  }

  //  裁剪圆形的几种形式
  Widget _buildCircleClipWidgets() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/avatar.jpeg'),
        ),
        ClipOval(
          child: _avatar,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: _avatar,
        ),
      ],
    );
  }

  Widget _buildCustomClip() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: ClipRect(
        clipper: const MyClipper(
          insets: EdgeInsets.fromLTRB(10, 20, 30, 40),
        ),
        child: _avatar,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  final EdgeInsets _insets;

  const MyClipper({required EdgeInsets insets}) : _insets = insets;

  //  裁剪区域
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      _insets.left,
      _insets.top,
      size.width - _insets.right,
      size.height - _insets.bottom,
    );
  }

  //  是否重新裁剪
  @override
  bool shouldReclip(MyClipper oldClipper) => oldClipper._insets != _insets;
}
