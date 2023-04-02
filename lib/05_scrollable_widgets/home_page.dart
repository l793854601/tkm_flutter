import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/single_child_scroll_view'),
              child: const Text('SingleChildScrollView'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/list_view'),
              child: const Text('ListView'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/grid_view'),
              child: const Text('GridView'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/page_view'),
              child: const Text('PageView'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/custom_scroll_view'),
              child: const Text('CustomScrollView'),
            ),
          ],
        ),
      ),
    );
  }
}
