import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBasicButtons(),
            _buildIconButtons(),
            _buildCustomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicButtons() {
    return Column(
      children: [
        //  RaisedButton已废弃
        ElevatedButton(
          onPressed: () => debugPrint('ElevatedButton tapped'),
          child: const Text('ElevatedButton'),
        ),
        TextButton(
          onPressed: () => debugPrint('TextButton tapped'),
          child: const Text('TextButton'),
        ),
        OutlinedButton(
          onPressed: () => debugPrint('TextButton tapped'),
          child: const Text('TextButton'),
        ),
        IconButton(
          onPressed: () => debugPrint('IconButton tapped'),
          icon: const Icon(Icons.child_care),
        ),
        FloatingActionButton(
          onPressed: () => debugPrint('FloatingActionButton tapped'),
          child: const Icon(Icons.arrow_upward),
        ),
      ],
    );
  }

  Widget _buildIconButtons() {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.send),
          label: const Text('Send'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.info),
          label: const Text('Detail'),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add'),
        ),
      ],
    );
  }

  Widget _buildCustomButton() {
    return ElevatedButton(
      onPressed: () => debugPrint('Custom Button tapped'),
      style: ButtonStyle(
        //  阴影
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        //  背景色
        backgroundColor: const MaterialStatePropertyAll(Colors.black),
        //  前景色，一般指定的是子Widget的颜色
        //  比如Text为文字颜色
        foregroundColor: const MaterialStatePropertyAll(Colors.cyan),
        //  去掉点击效果
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        //  去掉默认内边距
        // padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        // minimumSize: const MaterialStatePropertyAll(Size.zero),
        //  指定Button的大小
        //  如果尺寸小于minimumSize，则不会生效
        fixedSize: const MaterialStatePropertyAll(Size(150, 40)),
        // minimumSize: const MaterialStatePropertyAll(Size(200, 80)),

        //  除去Button占用的默认尺寸
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //  边框、圆角
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: const Text('Custom Button'),
    );
  }
}
