import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('didPop, route: $route, previousRoute: $previousRoute');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('didPush, route: $route, previousRoute: $previousRoute');
  }
}