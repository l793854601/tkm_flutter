import 'package:flutter/material.dart';
import 'package:tkm_flutter/04_container_widgets/home_page.dart';
import 'package:tkm_flutter/04_container_widgets/pages/clip_page.dart';
import 'package:tkm_flutter/04_container_widgets/pages/container_page.dart';
import 'package:tkm_flutter/04_container_widgets/pages/decorated_page.dart';
import 'package:tkm_flutter/04_container_widgets/pages/padding_page.dart';
import 'package:tkm_flutter/04_container_widgets/pages/scaffold_page.dart';
import 'package:tkm_flutter/04_container_widgets/pages/transform_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/padding': (ctx) => const PaddingPage(),
        '/decorated': (ctx) => const DecoratedPage(),
        '/transform': (ctx) => const TransformPage(),
        '/container': (ctx) => const ContainerPage(),
        '/clip': (ctx) => const ClipPage(),
        '/scaffold': (ctx) => const ScaffoldPage(),
      },
      initialRoute: '/',
    );
  }
}
