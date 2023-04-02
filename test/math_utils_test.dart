import 'package:flutter_test/flutter_test.dart';
import 'package:tkm_flutter/12_test/math_utils.dart';

void main() {
  test('test math utils sum', () {
    // assert(sum(1, 2) == 3);

    //  测试中使用expect函数
    expect(sum(1, 2), 3);
    expect(sum(10, 20), 30);
  });

  test('test math utils reduce', () {
    expect(reduce(10, 2), 8);
  });
  
  group('test math utils', () {
    test('test sum', () {
      expect(sum(1, 2), 3);
    });

    test('test reduce', () {
      expect(reduce(10, 2), 8);
    });
  });
}