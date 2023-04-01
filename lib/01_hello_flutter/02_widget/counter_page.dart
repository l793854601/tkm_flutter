import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  final int initValue;

  const CounterPage({Key? key, this.initValue = 0}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var _counter = 0;

  //  Widget第一次被插入到Widget树时调用
  //  可在此函数中做一些初始化操作
  @override
  void initState() {
    super.initState();
    debugPrint('_CounterPageState initState');
    _counter = widget.initValue;
  }

  //  Widget的canUpdate返回true时，会调用此函数
  @override
  void didUpdateWidget(covariant CounterPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('_CounterPageState didUpdateWidget');
  }

  //  依赖（比如InheritedWidget）发生变化时调用
  //  initState之后会调用一次
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('_CounterPageState didChangeDependencies');
  }

  //  主要用于构建Widget树
  //  initState之后会调用一次
  //  setState之后会调用一次
  //  didChangeDependencies之后会调用一次
  //  didUpdateWidget之后会调用一次
  //  State从树中移除后，又插入到其他位置之后会调用一次
  @override
  Widget build(BuildContext context) {
    debugPrint('_CounterPageState build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
          child: TextButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: Text('$_counter'),
      )),
    );
  }

  //  State从树中移除时调用
  //  移除后可能重新插入到树中，也可能销毁
  @override
  void deactivate() {
    super.deactivate();
    debugPrint('_CounterPageState deactivate');
  }

  //  State销毁时调用
  @override
  void dispose() {
    super.dispose();
    debugPrint('_CounterPageState dispose');
  }
}
