import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var _counter = 0;

  void _increment() {
    setState(() {
      assert(false, 'debug下断言是开启的');
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$_counter',
              key: const ValueKey('text'),
            ),
            ElevatedButton(
              key: const ValueKey('button'),
              onPressed: _increment,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
