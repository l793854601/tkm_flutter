import 'package:flutter/material.dart';
import 'package:tkm_flutter/01_hello_flutter/03_route/detail_page.dart';
import 'package:tkm_flutter/01_hello_flutter/03_route/home_page.dart';
import 'package:tkm_flutter/01_hello_flutter/03_route/my_navigator_observer.dart';
import 'package:tkm_flutter/01_hello_flutter/03_route/new_page.dart';
import 'package:tkm_flutter/01_hello_flutter/03_route/not_found_page.dart';
import 'package:tkm_flutter/01_hello_flutter/03_route/tip_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  定义命名路由表
      routes: {
        //  习惯上使用/表示首页
        '/': (ctx) => const HomePage(),
        '/new_page': (ctx) => const NewPage(),
        '/tip_page': (ctx) => const TipPage(),
      },
      //  路由钩子
      //  可获取RouteSettings属性，并拦截跳转
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/detail_page') {
          final id = settings.arguments as int;
          return MaterialPageRoute(builder: (ctx) => DetailPage(id: id));
        }
        return null;
      },
      //  跳转不存在的命名路由时，打开的页面
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (ctx) => const DefaultPage(),
      ),
      //  监听路由跳转
      navigatorObservers: [
        MyNavigatorObserver(),
      ],
      //  定义首页路由
      initialRoute: '/',
      //  如果指定了initialRoute，再指定home会抛出异常
      // home: const HomePage(),
    );
  }
}
