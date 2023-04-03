import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tkm_flutter/14_screen_fit/screen_util_lite.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildScreenInfoWidget(context),
            _buildSimpleWidgets(),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenInfoWidget(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    //  屏幕逻辑宽度
    final screenWidth = mediaQuery.size.width;
    //  屏幕逻辑长度
    final screenHeight = mediaQuery.size.height;
    //  屏幕物理宽度
    final physicalWidth = window.physicalSize.width;
    //  屏幕物理长度
    final physicalHeight = window.physicalSize.height;
    //  dpr（物理尺寸/逻辑尺寸）
    final devicePixelRatio = window.devicePixelRatio;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('屏幕逻辑宽度: $screenWidth'),
        Text('屏幕逻辑长度: $screenHeight'),
        Text('屏幕物理宽度: $physicalWidth'),
        Text('屏幕物理长度: $physicalHeight'),
        Text('dpr（物理尺寸/逻辑尺寸）: $devicePixelRatio'),
        Text('$physicalWidth / $screenWidth = ${physicalWidth / screenWidth}'),
        Text(
            '$physicalHeight / $screenHeight = ${physicalWidth / screenWidth}'),
      ],
    );
  }

  Widget _buildSimpleWidgets() {
    return Column(
      children: [
        Container(
          color: Colors.red,
          width: double.infinity,
          height: 64,
          child: const Text(
            'Raw, height: 64, fontSize: 14',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Container(
          color: Colors.orange,
          width: double.infinity,
          height: 128.rpx,
          child: Text(
            'rpx, height: 128rpx, fontSize: 28rpx',
            style: TextStyle(
              fontSize: 28.rpx,
            ),
          ),
        ),
        Container(
          color: Colors.yellow,
          width: double.infinity,
          height: 64.px,
          child: Text(
            'px, height: 64px, fontSize: 14px',
            style: TextStyle(
              fontSize: 14.px,
            ),
          ),
        ),
      ],
    );
  }
}
