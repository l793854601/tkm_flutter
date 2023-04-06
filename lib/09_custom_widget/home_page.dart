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
                  Navigator.pushNamed(context, '/gradient_button_page'),
              child: const Text('Gradient Button'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/draw_page'),
              child: const Text('Draw'),
            ),
          ],
        ),
      ),
    );
  }
}
