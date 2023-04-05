import 'package:flutter/material.dart';
import 'package:tkm_flutter/08_animations/pages/new_page.dart';

class RouteAnimationPage extends StatelessWidget {
  const RouteAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Animation'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _pushToNewPage(context),
          child: const Text('To New Page'),
        ),
      ),
    );
  }

  void _pushToNewPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeTransition(
            opacity: animation,
            child: const NewPage(),
          );
        },
      ),
    );
  }
}
