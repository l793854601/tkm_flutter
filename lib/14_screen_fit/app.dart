import 'package:flutter/material.dart';
import 'package:tkm_flutter/14_screen_fit/home_page.dart';
import 'package:tkm_flutter/14_screen_fit/screen_util_lite.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  ScreenUtilLite使用之前需要初始化
    ScreenUtilLite.init();
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
