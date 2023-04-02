import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex Page'),
      ),
      //  Row、Column的本质为Flex
      //  参考Android中的LinearLayout、Flex配合Expanded，可以平分Flex空间
      body: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          //  Expanded只可用在Flex中
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.orange,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.black,
            ),
          ),
          //  Spacer本质为Expanded
          const Spacer(),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.purple,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
