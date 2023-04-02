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
              onPressed: () => Navigator.pushNamed(context, '/constraints'),
              child: const Text('Constraints'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/linear_layout'),
              child: const Text('Linear Layout'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/flex'),
              child: const Text('Flex'),
            ),
          ],
        ),
      ),
    );
  }
}
