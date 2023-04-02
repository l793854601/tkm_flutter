import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tkm_flutter/12_test/counter_page.dart';

void main() {
  testMode();

  runApp(
    const MaterialApp(
      home: CounterPage(),
    ),
  );
}

void testMode() {
  String baseUrl = 'release url';
  //  根据断言在debug下生效的特性，修改baseUrl
  assert(() {
    baseUrl = 'debug url';
    return true;
  }());

  if (kDebugMode) {
    //  Debug模式
  }

  if (kProfileMode) {
    //  Profile模式
  }

  if (kReleaseMode) {
    //  Release模式
  }
}