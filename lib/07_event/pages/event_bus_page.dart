import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

//  定义全局的EventBus对象
final eventBus = EventBus();

class EventBusPage extends StatelessWidget {
  const EventBusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventBus Page'),
      ),
      body: const ResultWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  发送事件
          eventBus.fire(Random().nextInt(10));
        },
        child: const Icon(Icons.numbers),
      ),
    );
  }
}

class ResultWidget extends StatefulWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  var _counter = 0;

  @override
  void initState() {
    super.initState();
    //  接收事件
    eventBus.on<int>().listen((event) {
      setState(() {
        _counter = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          '$_counter',
          textScaleFactor: 5,
        ),
      ),
    );
  }
}
