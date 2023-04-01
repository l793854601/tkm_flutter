import 'package:flutter/material.dart';
import 'package:tkm_flutter/01_hello_flutter/01_app_extract/home_page.dart';

//  StatelessWidget：无状态Widget
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  //  build函数用于描述如何构建Widget树
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  Android某些版本中，最近应用名称
      title: 'Hello Flutter',
      //  主题
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //  应用首页路由
      home: const HomePage(
        title: 'First Flutter App',
      ),
    );
  }
}
