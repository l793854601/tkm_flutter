import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  在Widget中插入ChangeNotifierProvider
    //  开发中一般是将ChangeNotifierProvider插入到App层之上，本例仅做演示
    debugPrint('ProviderPage build');
    return ChangeNotifierProvider(
      create: (ctx) => CounterProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Provider Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                CounterWidget1(),
                CounterWidget2(),
                CounterWidget3(),
                CounterWidget4(),
                AddWidget(),
              ],
            ),
          )),
    );
  }
}

class CounterWidget1 extends StatelessWidget {
  const CounterWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('CounterWidget1 build');
    //  使用Consumer获取ChangeNotifier
    //  此方式可将build的范围缩小至Consumer内
    return Consumer<CounterProvider>(builder:
        (BuildContext context, CounterProvider provider, Widget? child) {
      //  取数据
      return Text('counter1: ${provider.counter}');
    });
  }
}

class CounterWidget2 extends StatelessWidget {
  const CounterWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('CounterWidget2 build');
    //  通过context获取ChangeNotifier
    //  相比Consumer，此方式获取了ChangeNotifier之后，每次数据发生变化，都要重新构建Widget
    final provider = context.watch<CounterProvider>();
    return Text('counter2: ${provider.counter}');
  }
}

class CounterWidget3 extends StatelessWidget {
  const CounterWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('CounterWidget3 build');
    //  此方式获取ChangeNotifier，等同于使用context获取
    final provider = Provider.of<CounterProvider>(context);
    return Text('counter3: ${provider.counter}');
  }
}

class CounterWidget4 extends StatelessWidget {
  const CounterWidget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('CounterWidget4 build');
    //  Consumer的简易实现
    //  将build的范围缩小至Builder中，而不是向外扩展
    return Builder(builder: (ctx) {
      debugPrint('CounterWidget4.Builder build');
      final provider = Provider.of<CounterProvider>(ctx);
      return Text('counter4: ${provider.counter}');
    });
  }
}

class AddWidget extends StatelessWidget {
  const AddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('AddWidget build');
    // return Consumer<CounterProvider>(
    //   builder: (ctx, provider, child) {
    //     return ElevatedButton(
    //       onPressed: () => provider.increment(),
    //       child: const Icon(Icons.add),
    //     );
    //   },
    // );

    //  listen传入false，避免不必要的build
    //  如果listen为true，则会执行context.dependOnInheritedWidgetOfExactType<_InheritedProviderScope<T?>>();注入依赖
    //  参考InheritedWidget示例
    final provider = Provider.of<CounterProvider>(context, listen: false);
    return ElevatedButton(
      onPressed: () => provider.increment(),
      child: const Icon(Icons.add),
    );
  }
}

//  定义Provider
//  对比InheritedWidget，Provider内部的状态（数据）可以改变并通知Listeners
class CounterProvider extends ChangeNotifier {
  var _counter = 0;

  int get counter => _counter;

  void increment() {
    ++_counter;
    //  数据改变，通知Listeners
    notifyListeners();
  }
}
