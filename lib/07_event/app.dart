import 'package:flutter/material.dart';
import 'package:tkm_flutter/07_event/home_page.dart';
import 'package:tkm_flutter/07_event/pages/event_bus_page.dart';
import 'package:tkm_flutter/07_event/pages/gesture_page.dart';
import 'package:tkm_flutter/07_event/pages/listener_page.dart';
import 'package:tkm_flutter/07_event/pages/notification_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/listener': (ctx) => const ListenerPage(),
        '/gesture': (ctx) => const GesturePage(),
        '/event_bus': (ctx) => const EventBusPage(),
        '/notification': (ctx) => const NotificationPage(),
      },
      initialRoute: '/',
    );
  }
}
