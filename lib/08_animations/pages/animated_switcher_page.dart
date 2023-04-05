import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatelessWidget {
  const AnimatedSwitcherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
      ),
      body: const AnimatedSwitcherBody(),
    );
  }
}

class AnimatedSwitcherBody extends StatefulWidget {
  const AnimatedSwitcherBody({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherBody> createState() => _AnimatedSwitcherBodyState();
}

class _AnimatedSwitcherBodyState extends State<AnimatedSwitcherBody> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchOutCurve: Curves.linear,
            switchInCurve: Curves.linear,
            transitionBuilder: (Widget? child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Text(
              '$_counter',
              //  设置不同的key，保证动画的执行
              key: UniqueKey(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Icon(
              Icons.exposure_plus_1,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter--;
              });
            },
            child: const Icon(
              Icons.exposure_minus_1,
            ),
          ),
        ],
      ),
    );
  }
}
