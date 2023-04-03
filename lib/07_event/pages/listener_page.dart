import 'package:flutter/material.dart';

class ListenerPage extends StatelessWidget {
  const ListenerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listener Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildBasicListener(),
              _buildAbsorbPointer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBasicListener() {
    return Listener(
      //  抬起
      onPointerUp: (PointerUpEvent event) {
        debugPrint('onPointerUp: $event');
        //  position：相对于屏幕的坐标
        //  localPosition：相对于子Widget本身布局的坐标
        debugPrint('position: ${event.position}, localPosition: ${event.localPosition}');
      },
      //  按下
      onPointerDown: (PointerDownEvent event) {
        debugPrint('onPointerDown: $event');
      },
      //  移动
      onPointerMove: (PointerMoveEvent event) {
        debugPrint('onPointerMove: $event');
      },
      //  取消
      onPointerCancel: (PointerCancelEvent event) {
        debugPrint('onPointerCancel: $event');
      },
      child: Container(
        color: Colors.red,
        width: double.infinity,
        height: 300,
      ),
    );
  }

  Widget _buildAbsorbPointer() {
    return Listener(
      onPointerDown: (event) => debugPrint('outer onPointerDown: $event'),
      //  忽略子Widget的Listener响应
      child: AbsorbPointer(
        child: Listener(
          onPointerDown: (event) => debugPrint('inner onPointerDown: $event'),
          child: Container(
            color: Colors.orange,
            width: double.infinity,
            height: 300,
          ),
        ),
      ),
    );
  }
}
