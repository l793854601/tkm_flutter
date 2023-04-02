import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Page'),
      ),
      body: SizedBox(
        height: 100,
        child: PageView(
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) => debugPrint('page changed: $index'),
          children: const [
            PageIndexItem(index: 0),
            PageIndexItem(index: 1),
            PageIndexItem(index: 2),
            PageIndexItem(index: 3),
          ],
        ),
      ),
    );
  }
}

class PageIndexItem extends StatefulWidget {
  final int _index;

  const PageIndexItem({Key? key, required int index})
      : _index = index,
        super(key: key);

  @override
  State<PageIndexItem> createState() => _PageIndexItemState();
}

//  配合AutomaticKeepAliveClientMixin，防止PageView的子Widget重复build
class _PageIndexItemState extends State<PageIndexItem> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint('page ${widget._index} build');
    return Container(
      alignment: Alignment.center,
      color: widget._index % 2 == 0 ? Colors.red : Colors.orange,
      child: Text(
        '${widget._index}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
