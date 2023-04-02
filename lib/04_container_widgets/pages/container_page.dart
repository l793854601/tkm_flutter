import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Page'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: 200,
        height: 100,
        // constraints: const BoxConstraints.tightFor(
        //   width: 200,
        //   height: 100,
        // ),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.red, Colors.orange],
            center: Alignment.topLeft,
            radius: 10,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4,
            ),
          ],
        ),
        transform: Matrix4.rotationZ(0.2),
        alignment: Alignment.center,
        child: const Text(
          'Hello',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
