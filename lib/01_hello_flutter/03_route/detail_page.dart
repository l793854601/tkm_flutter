import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int _id;

  const DetailPage({Key? key, required int id})
      : _id = id,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Text('id: $_id'),
      ),
    );
  }
}
