import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Page'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        //  交叉轴上固定子Widget数量
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 16 / 10,
        ),
        itemBuilder: (ctx, index) {
          return Image.network(
            'https://i0.hdslb.com/bfs/article/0ec8bb888677954ef67ec1ce1e88858cce89f8da.jpg',
            fit: BoxFit.cover,
          );
        },
        itemCount: 100,
      ),
    );
  }
}
