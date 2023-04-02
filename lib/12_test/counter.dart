class Counter {
  int _value = 0;

  void init(int value) {
    _value = value;
  }

  int increment() => ++_value;
  int decrement() => --_value;
}