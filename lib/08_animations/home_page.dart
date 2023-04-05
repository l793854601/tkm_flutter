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
              onPressed: () => Navigator.pushNamed(context, '/animation'),
              child: const Text('Animation'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/animated_widget'),
              child: const Text('AnimatedWidget'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/animated_builder'),
              child: const Text('AnimatedBuilder'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/stagger_animation'),
              child: const Text('Stagger Animation'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/animated_switcher'),
              child: const Text('AnimatedSwitcher'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/route_animation'),
              child: const Text('Route Animation'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/hero'),
              child: const Text('Hero'),
            ),
          ],
        ),
      ),
    );
  }
}
