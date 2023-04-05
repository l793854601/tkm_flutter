import 'package:flutter/material.dart';
import 'package:tkm_flutter/08_animations/home_page.dart';
import 'package:tkm_flutter/08_animations/pages/animated_builder_page.dart';
import 'package:tkm_flutter/08_animations/pages/animated_switcher_page.dart';
import 'package:tkm_flutter/08_animations/pages/animated_widget_page.dart';
import 'package:tkm_flutter/08_animations/pages/animation_page.dart';
import 'package:tkm_flutter/08_animations/pages/hero_page.dart';
import 'package:tkm_flutter/08_animations/pages/route_animation_page.dart';
import 'package:tkm_flutter/08_animations/pages/stagger_animation_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/animation': (ctx) => const AnimationPage(),
        '/animated_widget': (ctx) => const AnimatedWidgetPage(),
        '/animated_builder': (ctx) => const AnimatedBuilderPage(),
        '/stagger_animation': (ctx) => const StaggerAnimationPage(),
        '/animated_switcher': (ctx) => const AnimatedSwitcherPage(),
        '/route_animation': (ctx) => const RouteAnimationPage(),
        '/hero': (ctx) => const HeroPage(),
      },
      initialRoute: '/',
    );
  }
}
