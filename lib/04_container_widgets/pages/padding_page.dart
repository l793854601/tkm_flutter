import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding Page'),
      ),
      body: Padding(
        //  四个方向的间距一致
        padding: const EdgeInsets.all(8),
        child: Container(
          width: double.infinity,
          color: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                //  可以只传某个方向的间距
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.cyan,
                ),
              ),
              Padding(
                //  水平、垂直的间距
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.cyan,
                ),
              ),
              Padding(
                //  左、上、右、下的间距都要传
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
