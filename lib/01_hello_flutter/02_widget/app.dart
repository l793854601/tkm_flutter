import 'package:flutter/material.dart';
import 'package:tkm_flutter/01_hello_flutter/02_widget/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Widget管理',
      home: HomePage(),
    );
  }
}
