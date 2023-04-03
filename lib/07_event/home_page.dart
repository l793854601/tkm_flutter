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
              onPressed: () => Navigator.pushNamed(context, '/listener'),
              child: const Text('Listener'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/gesture'),
              child: const Text('Gesture'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/event_bus'),
              child: const Text('EventBus'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/notification'),
              child: const Text('Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
