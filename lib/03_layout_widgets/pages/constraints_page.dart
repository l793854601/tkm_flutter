import 'package:flutter/material.dart';

class ConstraintsPage extends StatelessWidget {
  const ConstraintsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constraints Page'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              _buildConstrainedBoxes(),
              _buildSizedBox(),
              _buildContainer(),
              _buildUnconstrainedBox(),
              _buildAspectRatio(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConstrainedBoxes() {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            minHeight: 80,
          ),
          child: Container(
            width: 10,
            height: 20,
            color: Colors.red,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 100,
            maxHeight: 80,
          ),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.black,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tight(
            const Size(100, 100),
          ),
          child: Container(
            color: Colors.blue,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(
            width: 200,
            height: 200,
          ),
          child: Container(
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildSizedBox() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Container(color: Colors.tealAccent),
    );
  }

  Widget _buildContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(
          color: Colors.black87,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      alignment: Alignment.center,
      width: 100,
      height: 100,
      child: const Text('Hello'),
    );
  }

  Widget _buildUnconstrainedBox() {
    return Container(
      //  minWidth、maxWidth
      width: 100,
      //  minWidth、maxWidth
      height: 100,
      color: Colors.yellow,
      //  使用UnconstrainedBox，突破父Widget的尺寸限制
      child: UnconstrainedBox(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildAspectRatio() {
    return SizedBox(
      height: 100,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
