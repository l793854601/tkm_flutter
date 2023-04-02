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
              onPressed: () => Navigator.pushNamed(context, '/padding'),
              child: const Text('Padding'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/decorated'),
              child: const Text('Decorated'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/transform'),
              child: const Text('Transform'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/container'),
              child: const Text('Container'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/clip'),
              child: const Text('Clip'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/scaffold'),
              child: const Text('Scaffold'),
            ),
          ],
        ),
      ),
    );
  }
}
