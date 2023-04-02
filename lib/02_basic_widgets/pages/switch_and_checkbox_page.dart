import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckBoxPage extends StatelessWidget {
  const SwitchAndCheckBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch And Checkbox Page'),
      ),
      body: const SwitchAndCheckboxBody(),
    );
  }
}

class SwitchAndCheckboxBody extends StatefulWidget {
  const SwitchAndCheckboxBody({Key? key}) : super(key: key);

  @override
  State<SwitchAndCheckboxBody> createState() => _SwitchAndCheckboxBodyState();
}

class _SwitchAndCheckboxBodyState extends State<SwitchAndCheckboxBody> {
  var _switchValue = false;

  var _cupertinoSwitchValue = false;

  var _checkboxValue = false;

  void _changeSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  void _changeCupertinoSwitchValue(bool value) {
    setState(() {
      _cupertinoSwitchValue = value;
    });
  }

  void _changeCheckboxValue(bool? value) {
    setState(() {
      _checkboxValue = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  Android风格的Switch
            Switch(
              activeColor: Colors.blue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.purple,
              inactiveTrackColor: Colors.red,
              value: _switchValue,
              onChanged: _changeSwitchValue,
            ),
            Text(
              _switchValue ? '开' : '关',
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  iOS风格的Switch（UISwitch）
            CupertinoSwitch(
              activeColor: Colors.red,
              trackColor: Colors.black,
              thumbColor: Colors.blue,
              value: _cupertinoSwitchValue,
              onChanged: _changeCupertinoSwitchValue,
            ),
            Text(
              _cupertinoSwitchValue ? '开' : '关',
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              tristate: true,
              checkColor: Colors.red,
              activeColor: Colors.black,
              value: _checkboxValue,
              onChanged: _changeCheckboxValue,
            ),
            Text(
              _checkboxValue ? '选中' : '未选中',
            ),
          ],
        ),
      ],
    );
  }
}
