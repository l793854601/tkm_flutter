import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatefulWidget {
  const SingleChildScrollViewPage({Key? key}) : super(key: key);

  @override
  State<SingleChildScrollViewPage> createState() => _SingleChildScrollViewPageState();
}

class _SingleChildScrollViewPageState extends State<SingleChildScrollViewPage> {

  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      debugPrint('offset: ${_controller.offset}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" * 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView Page'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: false,
          padding: const EdgeInsets.all(10),
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _controller,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: str.split('').map((e) {
                return Text(
                  e,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
