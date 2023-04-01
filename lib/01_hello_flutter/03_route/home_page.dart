import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tkm_flutter/01_hello_flutter/03_route/new_page.dart';

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const NewPage(),
                  ),
                );
              },
              child: const Text('To New Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (ctx) => const NewPage(),
                  ),
                );
              },
              child: const Text('To New Page Cupertino'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/new_page');
              },
              child: const Text('To New Page Named'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/tip_page',
                  arguments: {
                    'name': 'TKM',
                    'age': 20,
                  },
                );
              },
              child: const Text('Pass Args'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/detail_page',
                  arguments: 114514,
                );
              },
              child: const Text('Pass Args With Generate Route'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/not_found');
              },
              child: const Text('To Not Found Page'),
            ),
          ],
        ),
      ),
    );
  }
}
