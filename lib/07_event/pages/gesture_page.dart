import 'package:flutter/material.dart';

class GesturePage extends StatelessWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              PressWidget(),
              DragWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class PressWidget extends StatefulWidget {
  const PressWidget({Key? key}) : super(key: key);

  @override
  State<PressWidget> createState() => _PressWidgetState();
}

class _PressWidgetState extends State<PressWidget> {
  var _operation = 'N/A';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateOperation('Tap'),
      onDoubleTap: () => _updateOperation('Double Tap'),
      onLongPress: () => _updateOperation('Long Press'),
      child: Container(
        color: Colors.red,
        width: double.infinity,
        height: 300,
        alignment: Alignment.center,
        child: Text(_operation),
      ),
    );
  }

  void _updateOperation(String operation) {
    setState(() {
      _operation = operation;
    });
  }
}

class DragWidget extends StatefulWidget {
  const DragWidget({Key? key}) : super(key: key);

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  var _top = 0.0;
  var _left = 0.0;
  var _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.orange,
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return GestureDetector(
            //  开始拖动
            onPanStart: (DragStartDetails details) {
              setState(() {
                _color = Colors.purple;
              });
            },
            //  拖动中
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
                _top += details.delta.dy;
                if (_left < 0) {
                  _left = 0;
                }
                if (_top < 0) {
                  _top = 0;
                }
                if (_left + 40 > constraints.maxWidth) {
                  _left = constraints.maxWidth - 40;
                }
                if (_top + 40 > constraints.maxHeight) {
                  _top = constraints.maxHeight - 40;
                }
              });
            },
            //  结束拖动
            onPanEnd: (DragEndDetails details) {
              setState(() {
                _color = Colors.blue;
              });
            },
            //  取消拖动
            onPanCancel: () {
              setState(() {
                _color = Colors.blue;
              });
            },
            child: Stack(
              children: [
                Positioned(
                  top: _top,
                  left: _left,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: _color,
                    child: const Text('A'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
