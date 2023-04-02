import 'package:flutter_test/flutter_test.dart';
import 'package:tkm_flutter/12_test/counter.dart';

void main() {
  group('test Counter', () {

    final counter = Counter();

    //  测试初始化
    //  所有的test执行前，都会执行setUp内的逻辑
    setUp(() {
      counter.init(10);
    });

    test('counter increment', () {
      expect(counter.increment(), 11);
      expect(counter.increment(), 12);
    });

    test('counter decrement', () {
      expect(counter.decrement(), 9);
      expect(counter.decrement(), 8);
    });
  });
}