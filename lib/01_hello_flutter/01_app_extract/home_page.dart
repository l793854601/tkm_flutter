import 'package:flutter/material.dart';

//  StatefulWidget：有状态Widget，配合State使用
class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//  Flutter中，StatefulWidget、StatelessWidget都继承自Widget，Widget被@immutable修饰
//  @immutable修饰的类表示不可变的，内部的属性也应该是final的
//  因此将可变的属性放在State中管理
class _HomePageState extends State<HomePage> {
  var _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  Scaffold：快速构建页面元素
    //  顶部导航、底部导航、侧滑等
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //  State内部可以通过widget属性，访问对应的Stateful中的属性
          widget.title,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
