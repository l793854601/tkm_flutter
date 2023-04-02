import 'package:flutter/material.dart';
import 'package:tkm_flutter/02_basic_widgets/home_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/button_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/form_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/image_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/indicator_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/switch_and_checkbox_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/text_field_page.dart';
import 'package:tkm_flutter/02_basic_widgets/pages/text_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomePage(),
        '/text': (ctx) => const TextPage(),
        '/button': (ctx) => const ButtonsPage(),
        '/image': (ctx) => const ImagePage(),
        '/switch_and_checkbox': (ctx) => const SwitchAndCheckBoxPage(),
        '/text_field': (ctx) => const TextFieldPage(),
        '/form': (ctx) => const FormPage(),
        '/indicator': (ctx) => const IndicatorPage(),
      },
      initialRoute: '/',
    );
  }
}
