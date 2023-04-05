import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Page'),
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

//  将渲染动画的StatefulWidget对应的State类混入SingleTickerProviderStateMixin，实现TickerProvider
class _SimpleAnimationWidgetState extends State<SimpleAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation _curvedAnimation;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    //  1.AnimationController：继承自Animation
    //  控制动画启动、暂停、结束、反转
    _animationController = AnimationController(
      //  vsync：同步刷新信号，防止屏外动画消耗不必要的资源
      vsync: this,
      //  动画执行时间
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      //  设置动画执行范围
      //  如果使用了CurvedAnimation包装AnimationController，则AnimationController的范围只能是0~1
      lowerBound: 0,
      upperBound: 1,
    );

    //  2.CurvedAnimation：控制动画执行的速率（速度曲线）
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    );

    //  3.Tween：映射AnimationController的范围
    //  调用animated()函数，生成Animation对象
    //  Animation：动画的核心类，抽象类
    _animation = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(_curvedAnimation);

    //  监听动画执行进度
    _animationController.addListener(() {
      setState(() {});
    });

    //  监听动画状态
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //  此方式构建动画，父Widget会不断执行build
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
              Icon(
                size: _animation.value,
                Icons.favorite,
                color: Colors.red,
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
                debugPrint('status = $status');
                if (status == AnimationStatus.completed ||
                    status == AnimationStatus.reverse) {
                  _animationController.reverse();
                } else if (status == AnimationStatus.dismissed ||
                    status == AnimationStatus.forward) {
                  _animationController.forward();
                } else {
                  _animationController.stop();
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
    //  销毁AnimationController
    //  需要在super.dispose();之前调用dispose()
    _animationController.dispose();
    super.dispose();
  }
}
