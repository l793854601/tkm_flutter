import 'package:flutter/material.dart';

class GradientButtonPage extends StatelessWidget {
  const GradientButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient Button Page'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: GradientButton(
              colors: const [
                Colors.red,
                Colors.orange,
              ],
              onPressed: () => debugPrint('GradientButton clicked'),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GradientButton(
            colors: const [
              Colors.blue,
              Colors.purple,
            ],
            width: double.infinity,
            height: 50,
            onPressed: () => debugPrint('GradientButton clicked'),
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          GradientButton(
            colors: const [
              Colors.cyan,
              Colors.brown,
            ],
            onPressed: () => debugPrint('GradientButton clicked'),
            child: const Text(
              'Send',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          GradientButton(
            colors: const [
              Colors.black,
              Colors.grey,
            ],
            width: 200,
            height: 40,
            onPressed: () => debugPrint('GradientButton clicked'),
            child: const Text(
              'Fuck Bread',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  组合现有Widget，实现自定义Widget
class GradientButton extends StatelessWidget {
  static const _defaultWidth = 100.0;
  static const _defaultHeight = 50.0;

  final List<Color> _colors;
  final GestureTapCallback _onPressed;
  final Widget? _child;
  final double? _width;
  final double? _height;

  const GradientButton({
    Key? key,
    required List<Color> colors,
    required GestureTapCallback onPressed,
    Widget? child,
    double? width,
    double? height,
  })  : _colors = colors,
        _onPressed = onPressed,
        _child = child,
        _width = width,
        _height = height,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        debugPrint('constraints: $constraints');
        return ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: _width ??
                (constraints.maxWidth == double.infinity
                    ? _defaultWidth
                    : constraints.maxWidth),
            height: _height ??
                (constraints.maxHeight == double.infinity
                    ? _defaultHeight
                    : constraints.maxHeight),
          ),
          child: GestureDetector(
            onTap: _onPressed,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: _colors),
              ),
              child: Center(child: _child),
            ),
          ),
        );
      },
    );
  }
}
