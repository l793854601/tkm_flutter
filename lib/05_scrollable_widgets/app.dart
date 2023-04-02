import 'package:flutter/material.dart';
import 'package:tkm_flutter/05_scrollable_widgets/home_page.dart';
import 'package:tkm_flutter/05_scrollable_widgets/pages/custom_scroll_view_page.dart';
import 'package:tkm_flutter/05_scrollable_widgets/pages/grid_view_page.dart';
import 'package:tkm_flutter/05_scrollable_widgets/pages/list_view_page.dart';
import 'package:tkm_flutter/05_scrollable_widgets/pages/page_view_page.dart';
import 'package:tkm_flutter/05_scrollable_widgets/pages/single_child_scroll_view_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/single_child_scroll_view': (ctx) => const SingleChildScrollViewPage(),
        '/list_view': (ctx) => const ListViewPage(),
        '/list_view_simple': (ctx) => const ListViewSimplePage(),
        '/list_view_builder': (ctx) => const ListViewBuilderPage(),
        '/list_view_separated': (ctx) => const ListViewSeparatedPage(),
        '/grid_view': (ctx) => const GridViewPage(),
        '/page_view': (ctx) => const PageViewPage(),
        '/custom_scroll_view': (ctx) => const CustomScrollViewPage(),
      },
      initialRoute: '/',
    );
  }
}
