import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndicatorPage extends StatelessWidget {
  const IndicatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indicator Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLinearProgressIndicator(),
            _buildCircleProgressIndicator(),
            _buildRefreshProgressIndicator(),
            _buildCupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildLinearProgressIndicator() {
    return const SizedBox(
      height: 5,
      child: LinearProgressIndicator(
        backgroundColor: Colors.black,
        color: Colors.red,
        //  不指定value，则默认会播放动画
        // value: 0.5,
      ),
    );
  }

  Widget _buildCircleProgressIndicator() {
    return const SizedBox(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
        color: Colors.yellow,
      ),
    );
  }

  Widget _buildRefreshProgressIndicator() {
    return const SizedBox(
      width: 50,
      height: 50,
      child: RefreshProgressIndicator(
        backgroundColor: Colors.black,
        color: Colors.yellow,
      ),
    );
  }

  Widget _buildCupertinoActivityIndicator() {
    return const CupertinoActivityIndicator(
      radius: 25,
      color: Colors.red,
    );
  }
}
