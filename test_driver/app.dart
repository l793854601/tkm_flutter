import 'package:flutter_driver/driver_extension.dart';
import 'package:tkm_flutter/12_test/main.dart' as app;

//  必须严格按照路径与名称：
//  - test_drive
//    - app.dart
//    - app_test.dart
void main() {
  //  1.初始化Driver
  enableFlutterDriverExtension();

  //  2.启动应用程序
  app.main();

  //  3.执行命令：flutter drive --target=test_driver/app.dart
}