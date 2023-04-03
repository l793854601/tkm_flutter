import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatelessWidget {
  const InheritedWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Page'),
      ),
      body: const InheritedWidgetBody(),
    );
  }
}

class InheritedWidgetBody extends StatefulWidget {
  const InheritedWidgetBody({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetBody> createState() => _InheritedWidgetBodyState();
}

class _InheritedWidgetBodyState extends State<InheritedWidgetBody> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    //  将InheritedWidget包裹在需要共享的子Widget之上
    return SharedDataWidget(
      data: _counter,
      child: Center(
        child: Column(
          children: [
            //  消除子Widget不重新构建的干扰，传入唯一的key
            const CounterWidget(key: ValueKey('Fuck bread')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('_CounterWidgetState didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_CounterWidgetState build');
    //  获取InheritedWidget，取数据
    final sharedDataWidget = SharedDataWidget.of(context);
    return Text('counter: ${sharedDataWidget._data}');
  }
}

//  定义InheritedWidget
//  FlutterSDK中常见的用到InheritedWidget的地方：
//  1.Theme
//  2.MediaQuery
class SharedDataWidget extends InheritedWidget {
  final int _data;

  const SharedDataWidget({
    super.key,
    required int data,
    required super.child,
  }) : _data = data;

  static SharedDataWidget of(BuildContext context) {
    //  此方法相比以下方法，内部多调用了dependOnInheritedElement
    //  dependOnInheritedElement内部会调用_dependencies!.add(ancestor);
    //  因此当InheritedWidget发生变化时（updateShouldNotify返回true），会通知子StatefulWidget执行didChangeDependencies
    final widget =
        context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
    assert(widget != null, 'Can\'t find SharedDataWidget');
    return widget!;

    // return context
    //     .getElementForInheritedWidgetOfExactType<SharedDataWidget>()
    //     ?.widget as SharedDataWidget;
  }

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) {
    debugPrint('SharedDataWidget updateShouldNotify');
    return oldWidget._data != _data;
  }
}
