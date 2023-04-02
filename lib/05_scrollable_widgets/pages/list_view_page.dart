import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/list_view_simple'),
              child: const Text('Simple'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/list_view_builder'),
              child: const Text('ListView.Builder'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/list_view_separated'),
              child: const Text('ListView.Separated'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewSimplePage extends StatelessWidget {
  const ListViewSimplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Page'),
      ),
      //  这种方式无缓存
      body: ListView(
        scrollDirection: Axis.vertical,
        //  长度是否根据子Widget的总体长度决定
        //  默认情况下，ListView会尽可能占据长度
        shrinkWrap: true,
        reverse: false,
        //  子Item高度固定，则可设置此参数
        itemExtent: 50,
        children: List.generate(100, (index) => index).map((e) {
          return Container(
            color: e % 2 == 0 ? Colors.red : Colors.orange,
            child: Text(
              '$e',
              style: const TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ListViewBuilderPage extends StatelessWidget {
  const ListViewBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.Builder Page'),
      ),
      body: Scrollbar(
        //  这种方式有缓存
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            debugPrint('itemBuilder called index: $index');
            return ListTile(
              title: Text('$index row'),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.Separated Page'),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text('$index row'),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider(color: index % 2 == 0 ? Colors.red : Colors.black);
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
