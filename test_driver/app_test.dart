import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('test counter page', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    //  通过给Widget设置的key，找到对应的组件
    final textFinder = find.byValueKey('text');
    final buttonFinder = find.byValueKey('button');

    test('text default value', () async {
      expect(await driver?.getText(textFinder), '0');
    });

    test('button click', () async {
      await driver?.tap(buttonFinder);
      await driver?.tap(buttonFinder);
      await driver?.tap(buttonFinder);
      expect(await driver?.getText(textFinder), '3');
    });

    //  测试完毕执行的逻辑
    tearDownAll(() {
      driver?.close();
    });
  });
}