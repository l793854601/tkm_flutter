import 'package:flutter/material.dart';
import 'package:tkm_flutter/02_basic_widgets/home_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/buttons_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/text_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/text': (ctx) => const TextPage(),
        '/buttons': (ctx) => const ButtonsPage(),
      },
      initialRoute: '/',
    );
  }
}
