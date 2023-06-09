import 'package:flutter/material.dart';
import 'package:tkm_flutter/03_layout_widgets/home_page.dart';
import 'package:tkm_flutter/03_layout_widgets/pages/align_page.dart';
import 'package:tkm_flutter/03_layout_widgets/pages/builder_page.dart';
import 'package:tkm_flutter/03_layout_widgets/pages/constraints_page.dart';
import 'package:tkm_flutter/03_layout_widgets/pages/flex_page.dart';
import 'package:tkm_flutter/03_layout_widgets/pages/linear_layout_page.dart';
import 'package:tkm_flutter/03_layout_widgets/pages/stack_page.dart';
import 'package:tkm_flutter/03_layout_widgets/pages/wrap_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/constraints': (ctx) => const ConstraintsPage(),
        '/linear_layout': (ctx) => const LinearLayoutPage(),
        '/flex': (ctx) => const FlexPage(),
        '/wrap': (ctx) => const WrapPage(),
        '/stack': (ctx) => const StackPage(),
        '/align': (ctx) => const AlignPage(),
        '/builder': (ctx) => const BuilderPage(),
      },
      initialRoute: '/',
    );
  }
}
