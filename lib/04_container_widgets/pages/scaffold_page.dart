import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  final _indexPages = const [
    IndexPage(title: '首页'),
    IndexPage(title: '新闻'),
    IndexPage(title: '购物车'),
    IndexPage(title: '我的'),
  ];

  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _indexPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index != _index) {
            setState(() {
              _index = index;
            });
          }
        },
        currentIndex: _index,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: '新闻',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '购物车',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
      endDrawer: const Drawer(
        backgroundColor: Colors.grey,
      ),
    );
  }
}

class IndexPage extends StatelessWidget {
  final String _title;

  const IndexPage({Key? key, required String title})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: _buildActions(context),
      ),
      body: Center(
        child: Text(_title),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  List<Widget>? _buildActions(BuildContext context) {
    if (_title == '首页') {
      return [
        InkWell(
          child: const Icon(Icons.menu),
          onTap: () => Scaffold.of(context).openEndDrawer(),
        ),
      ];
    }
    return null;
  }

  Widget? _buildFloatingActionButton() {
    if (_title == '首页') {
      return FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      );
    }
    return null;
  }
}
