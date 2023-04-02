import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatelessWidget {
  const CustomScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('CustomScrollView Page'),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.cyan,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            sliver: SliverGrid(
              //Grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //  创建子widget
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) {
                  return Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
