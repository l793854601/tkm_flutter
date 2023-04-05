import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//  创建MethodChannel
//  name必须是唯一的
const platform = MethodChannel('com.tkm.flutter/battery_level');

class BatteryLevelPage extends StatelessWidget {
  const BatteryLevelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Level Page'),
      ),
      body: const BatteryLevelBody(),
    );
  }
}

class BatteryLevelBody extends StatefulWidget {
  const BatteryLevelBody({Key? key}) : super(key: key);

  @override
  State<BatteryLevelBody> createState() => _BatteryLevelBodyState();
}

class _BatteryLevelBodyState extends State<BatteryLevelBody> {
  var _batteryLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _getBatteryLevel,
          child: const Text('获取电量信息'),
        ),
        Text('剩余电量: $_batteryLevel'),
      ],
    );
  }

  void _getBatteryLevel() async {
    //  通过MethodChannel，调用原生方法
    //  method要与原生方法一一对应
    try {
      final result = await platform.invokeMethod<int>('getBatteryInfo');
      if (result != null) {
        setState(() {
          _batteryLevel = result;
        });
      }
    } catch(error) {
      debugPrint('catch error: $error');
    }
  }
}
