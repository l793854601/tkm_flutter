import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Page'),
      ),
      body: const ScrollNotificationWidget(),
    );
  }
}

class ScrollNotificationWidget extends StatefulWidget {
  const ScrollNotificationWidget({Key? key}) : super(key: key);

  @override
  State<ScrollNotificationWidget> createState() =>
      _ScrollNotificationWidgetState();
}

class _ScrollNotificationWidgetState extends State<ScrollNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          //  开始滑动
          debugPrint('begin scroll');
        }
        if (notification is ScrollUpdateNotification) {
          //  正在滑动
          debugPrint('scrolling, offset: ${notification.metrics.pixels}');
        }
        if (notification is ScrollEndNotification) {
          //  滑动结束
          debugPrint('end scrolling');
        }
        //  返回值表示是否继续向上（冒泡）分发通知
        //  true为阻止冒泡
        //  false为允许冒泡
        return false;
      },
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text('Row $index'),
          );
        },
        itemCount: 100,
      ),
    );
  }
}
