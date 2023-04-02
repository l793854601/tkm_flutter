import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  const WrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap Page'),
      ),
      body: const WrapBody(),
    );
  }
}

class WrapBody extends StatefulWidget {
  const WrapBody({Key? key}) : super(key: key);

  @override
  State<WrapBody> createState() => _WrapBodyState();
}

class _WrapBodyState extends State<WrapBody> {
  final _recentList = [
    'PopupRoute',
    '孤岛惊魂6全收集',
    '电锯爷',
    'r星出品什么梗',
    '孤岛惊魂6黑市武器',
    '喋血复仇周淑怡',
    'speed小吴',
    '极限竞速地平线5DLC',
    'GT7',
    '老戴在此',
    '小香草行不行',
    '生化危机4重制版',
    '野兽先辈',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: _recentList.map((e) {
            return InkWell(
              onTap: () => debugPrint('click: $e'),
              child: Chip(
                //  除去默认的内边距
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                deleteIcon: const Icon(Icons.delete),
                onDeleted: () {
                  setState(() {
                    _recentList.remove(e);
                  });
                },
                label: Text(e),
                avatar: const CircleAvatar(
                  backgroundColor: Colors.purple,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
