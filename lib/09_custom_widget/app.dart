import 'package:flutter/material.dart';
import 'package:tkm_flutter/09_custom_widget/home_page.dart';
import 'package:tkm_flutter/09_custom_widget/pages/draw_page.dart';
import 'package:tkm_flutter/09_custom_widget/pages/gradient_button_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/gradient_button_page': (ctx) => const GradientButtonPage(),
        '/draw_page': (ctx) => const DrawPage(),
      },
      initialRoute: '/',
    );
  }
}
