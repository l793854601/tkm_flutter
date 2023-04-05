import 'dart:math';

import 'package:flutter/material.dart';

class StaggerAnimationPage extends StatelessWidget {
  const StaggerAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StaggerAnimation Page'),
      ),
      body: const StaggerAnimationBody(),
    );
  }
}

class StaggerAnimationBody extends StatefulWidget {
  const StaggerAnimationBody({Key? key}) : super(key: key);

  @override
  State<StaggerAnimationBody> createState() => _StaggerAnimationBodyState();
}

class _StaggerAnimationBodyState extends State<StaggerAnimationBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation _curvedAnimation;

  //  交织动画，就是组合动画
  late Animation<double> _transformAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

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

    _transformAnimation = Tween(
      begin: 0.0,
      end: pi * 2,
    ).animate(_curvedAnimation);

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_curvedAnimation);

    _sizeAnimation = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(_curvedAnimation);

    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(_curvedAnimation);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      } else if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_StaggerAnimationBodyState build');
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (ctx, child) {
          return Transform(
            transform: Matrix4.rotationZ(_transformAnimation.value),
            alignment: Alignment.center,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                color: _colorAnimation.value,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
