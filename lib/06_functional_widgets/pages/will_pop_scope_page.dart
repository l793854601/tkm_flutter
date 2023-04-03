import 'package:flutter/material.dart';

class WillPopScopePage extends StatefulWidget {
  const WillPopScopePage({Key? key}) : super(key: key);

  @override
  State<WillPopScopePage> createState() => _WillPopScopePageState();
}

class _WillPopScopePageState extends State<WillPopScopePage> {
  @override
  Widget build(BuildContext context) {
    //  拦截路由pop
    return WillPopScope(
      onWillPop: () async => await _pushConfirmDialog(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WillPopScope Page'),
        ),
        body: const Placeholder(),
      ),
    );
  }

  Future<bool> _pushConfirmDialog(BuildContext context) async {
    final pop = await Navigator.push<bool>(
      context,
      DialogRoute(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('提示'),
            content: const Text('确定要退出吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('确定'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('取消'),
              ),
            ],
          );
        },
      ),
    );
    return pop ?? false;
  }
}
