import 'dart:developer';

import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/detail_page',
                (route) => route.settings.name == '/',
                arguments: 191919,
              );
            },
            child: const Text('Push And Pop Current'),
          ),
        ],
      ),
    );
  }
}
