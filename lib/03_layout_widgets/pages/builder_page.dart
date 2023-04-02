import 'package:flutter/material.dart';

class BuilderPage extends StatelessWidget {
  const BuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder Page'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              //  builder的本质为StatelessWidget，在内部执行build时，会执行builder内部的方法
              Builder(builder: (ctx) {
                return ElevatedButton(
                  onPressed: () {
                    //  context不能获取到Scaffold，因为Scaffold对应的element在context之下
                    //  沿着context无法找到Scaffold
                    Scaffold.of(ctx).openDrawer();
                  },
                  child: const Text('打开抽屉'),
                );
              }),
              //  LayoutBuilder内部可以获取父Widget给子Widget的约束
              LayoutBuilder(builder: (ctx, BoxConstraints constraints) {
                debugPrint('constraints: $constraints');
                return ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                );
              }),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.red,
      ),
    );
  }
}
