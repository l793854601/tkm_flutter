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
              onPressed: () => Navigator.pushNamed(context, '/text'),
              child: const Text('Text'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/button'),
              child: const Text('Button'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/image'),
              child: const Text('Image'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/switch_and_checkbox'),
              child: const Text('Switch And Checkbox'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/text_field'),
              child: const Text('TextField'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/form'),
              child: const Text('Form'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/indicator'),
              child: const Text('Indicator'),
            ),
          ],
        ),
      ),
    );
  }
}
