import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _showAlertDialog(context),
              child: const Text('Show AlertDialog'),
            ),
            ElevatedButton(
              onPressed: () => _showCupertinoAlertDialog(context),
              child: const Text('Show CupertinoAlertDialog'),
            ),
            ElevatedButton(
              onPressed: () => _showSimpleDialog(context),
              child: const Text('Show SimpleDialog'),
            ),
            ElevatedButton(
              onPressed: () => _showListDialog(context),
              child: const Text('Show List Dialog'),
            ),
            ElevatedButton(
              onPressed: () => _showLoadingDialog(context),
              child: const Text('Show Loading Dialog'),
            ),
            ElevatedButton(
              onPressed: () => _showCupertinoDatePicker(context),
              child: const Text('Show CupertinoDatePicker'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("提示"),
          content: const Text("确定要退出登录吗？"),
          actions: [
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text("确定"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
    debugPrint('result: $result');
  }

  void _showCupertinoAlertDialog(BuildContext context) async {
    //  iOS中的AlertView，点击空白处无法消失
    final result = await showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: const Text("提示"),
          content: const Text("确定要退出登录吗？"),
          actions: [
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text("确定"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
    debugPrint('result: $result');
  }

  void _showSimpleDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text('选择语言'),
          children: [
            SimpleDialogOption(
              child: const Text('简体中文'),
              onPressed: () => Navigator.pop(context, 0),
            ),
            SimpleDialogOption(
              child: const Text('繁体中文'),
              onPressed: () => Navigator.pop(context, 1),
            ),
            SimpleDialogOption(
              child: const Text('英国英语'),
              onPressed: () => Navigator.pop(context, 2),
            ),
            SimpleDialogOption(
              child: const Text('日语'),
              onPressed: () => Navigator.pop(context, 3),
            ),
          ],
        );
      },
    );
    debugPrint('result: $result');
  }

  void _showListDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Column(
            children: [
              const ListTile(
                title: Text('请选择'),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                  itemCount: 30,
                ),
              ),
            ],
          ),
        );
      },
    );
    debugPrint('result: $result');
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      //  如果为false，则需要代码关闭Dialog
      barrierDismissible: true,
      builder: (ctx) {
        //  使用UnconstrainedBox，消除Dialog的尺寸约束
        return UnconstrainedBox(
          child: SizedBox(
            width: 280,
            child: Dialog(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 26),
                      child: Text("正在加载，请稍后..."),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return Container(
          height: 200,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {
              debugPrint('onDateTimeChanged: $dateTime');
            },
          ),
        );
      },
    );
  }
}
