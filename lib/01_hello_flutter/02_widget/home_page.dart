import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tkm_flutter/01_hello_flutter/02_widget/counter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //  BuildContext本质为对应的Element
  //  Widget中有个抽象函数：Element createElement()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      //  Container继承自StatelessWidget，本身不具备渲染能力
      //  Container根据自身的属性（color、padding、alignment等），在build函数中构建对应的SingleChildRenderObjectWidget
      //  RenderObjectWidget中createRenderObject函数返回的是真正用于渲染的RenderObject
      body: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //  Text真正用于渲染的Widget为RichText
            const Text('Hello World'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const CounterPage(initValue: 10),
                  ),
                );
              },
              child: const Text('Counter Page'),
            ),
            Builder(
              builder: (ctx) {
                return ElevatedButton(
                  onPressed: () {
                    //  通过BuildContext，沿着Widget树查找最近的StatefulWidget对应的State
                    ScaffoldState? scaffoldState =
                        ctx.findAncestorStateOfType<ScaffoldState>();
                    scaffoldState?.openDrawer();
                    // Scaffold.of(ctx).openDrawer();
                  },
                  child: const Text('Open Drawer'),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Hello'),
                  ),
                );
              },
              child: const Text('Show SnackBar'),
            ),
            Builder(
              builder: (ctx) {
                return ElevatedButton(
                  onPressed: () {
                    Scaffold.of(ctx).showBottomSheet(
                      (context) {
                        return CupertinoActionSheet(
                          title: const Text('Title'),
                          message: const Text('Message'),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: const Text('Action1'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: const Text('Action2'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () => Navigator.of(ctx).pop(),
                              isDestructiveAction: true,
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Open Bottom Sheet'),
                );
              },
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.orange,
      ),
    );
  }
}
