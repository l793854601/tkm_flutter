import 'package:flutter/material.dart';

class ValueListenableBuilderPage extends StatelessWidget {
  const ValueListenableBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableBuilder Page'),
      ),
      body: const ValueListenerBuilderBody(),
    );
  }
}

class ValueListenerBuilderBody extends StatefulWidget {
  const ValueListenerBuilderBody({Key? key}) : super(key: key);

  @override
  State<ValueListenerBuilderBody> createState() =>
      _ValueListenerBuilderBodyState();
}

class _ValueListenerBuilderBodyState extends State<ValueListenerBuilderBody> {
  final _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    debugPrint('_ValueListenerBuilderBodyState build');
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder<int>(
            valueListenable: _counter,
            builder: (BuildContext context, int value, Widget? child) {
              debugPrint('ValueListenableBuilder build');
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  child!,
                  Text('$value次'),
                ],
              );
            },
            child: const TitleWidget(),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter.value++;
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('TitleWidget build');
    return const Text('点击了: ');
  }
}
