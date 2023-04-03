import 'package:flutter/material.dart';
import 'package:tkm_flutter/06_functional_widgets/home_page.dart';
import 'package:tkm_flutter/06_functional_widgets/pages/dialog_page.dart';
import 'package:tkm_flutter/06_functional_widgets/pages/future_builder_page.dart';
import 'package:tkm_flutter/06_functional_widgets/pages/inherited_widget_page.dart';
import 'package:tkm_flutter/06_functional_widgets/pages/provider_page.dart';
import 'package:tkm_flutter/06_functional_widgets/pages/value_listenable_builder_page.dart';
import 'package:tkm_flutter/06_functional_widgets/pages/will_pop_scope_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/will_pop_scope': (ctx) => const WillPopScopePage(),
        '/inherited_widget': (ctx) => const InheritedWidgetPage(),
        '/provider': (ctx) => const ProviderPage(),
        '/value_listenable_builder': (ctx) => const ValueListenableBuilderPage(),
        '/future_builder': (ctx) => const FutureBuilderPage(),
        '/dialog': (ctx) => const DialogPage(),
      },
      initialRoute: '/',
    );
  }
}
