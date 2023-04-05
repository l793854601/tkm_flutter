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
              onPressed: () => Navigator.pushNamed(context, '/image_picker'),
              child: const Text('Image Picker'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/battery_level'),
              child: const Text('Battery Level'),
            ),
          ],
        ),
      ),
    );
  }
}
