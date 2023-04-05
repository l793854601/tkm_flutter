import 'package:flutter/material.dart';
import 'package:tkm_flutter/15_hybrid/home_page.dart';
import 'package:tkm_flutter/15_hybrid/pages/battery_level_page.dart';
import 'package:tkm_flutter/15_hybrid/pages/image_picker_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/image_picker': (ctx) => const ImagePickerPage(),
        '/battery_level': (ctx) => const BatteryLevelPage(),
      },
      initialRoute: '/',
    );
  }
}
