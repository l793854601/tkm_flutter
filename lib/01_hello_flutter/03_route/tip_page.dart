import 'package:flutter/material.dart';

class TipPage extends StatelessWidget {
  const TipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Page'),
      ),
      body: Column(
        children: [
          Text('name: ${args['name']}'),
          Text('age: ${args['age']}'),
        ],
      ),
    );
  }
}
