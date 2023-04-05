import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatelessWidget {
  const AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBuilder Page'),
      ),
      body: const SimpleAnimationWidget(),
    );
  }
}

class SimpleAnimationWidget extends StatefulWidget {
  const SimpleAnimationWidget({Key? key}) : super(key: key);

  @override
  State<SimpleAnimationWidget> createState() => _SimpleAnimationWidgetState();
}

class _SimpleAnimationWidgetState extends State<SimpleAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation _curvedAnimation;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );

    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    );

    _animation = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(_curvedAnimation);

    _animationController.addStatusListener((status) {
      final status = _animationController.status;
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      } else if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_SimpleAnimationWidgetState build');
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              //  使用AnimatedBuilder包裹需要执行动画的Widget
              //  相比于AnimatedWidget，AnimatedBuilder无需重新创建类
              //  Builder这种模式在Flutter中比比皆是
              AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext ctx, Widget? child) {
                  debugPrint('AnimatedBuilder builder');
                  return Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: _animation.value,
                  );
                },
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_animationController.isAnimating) {
                _animationController.stop();
              } else {
                final status = _animationController.status;
                if (status == AnimationStatus.dismissed ||
                    status == AnimationStatus.forward) {
                  _animationController.forward();
                } else if (status == AnimationStatus.completed ||
                    status == AnimationStatus.reverse) {
                  _animationController.reverse();
                }
              }
            });
          },
          child: Icon(
            _animationController.isAnimating
                ? Icons.pause_circle
                : Icons.play_circle,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
