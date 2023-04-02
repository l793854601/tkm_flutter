import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Page'),
      ),
      //  确保Stack占满整个屏幕
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        //  Stack配合Positioned使用
        //  Stack的子Widget可以层叠（参考Android的FrameLayout）
        child: Stack(
          //  未使用Positioned包裹的子Widget的对齐方式
          //  此参数也会影响未设置四个方向的Positioned的子Widget对齐方式
          alignment: Alignment.center,
          //  未使用Positioned包裹的子Widget如何填充
          fit: StackFit.loose,
          //  Stack中的子Widget，按照先后顺序层叠排放
          children: [
            //  未使用Positioned包裹的子Widget，对齐方式由alignment决定，填充方式由fit决定
            Container(
              color: Colors.tealAccent,
              width: 200,
              height: 200,
            ),
            //  未设置四个方向的Positioned，对齐方式由alignment决定
            Positioned(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.orange,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.cyan,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.purple,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.purple,
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

