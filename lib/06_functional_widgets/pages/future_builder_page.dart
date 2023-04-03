import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Page'),
      ),
      body: const FutureBuilderBody(),
    );
  }
}

class FutureBuilderBody extends StatefulWidget {
  const FutureBuilderBody({Key? key}) : super(key: key);

  @override
  State<FutureBuilderBody> createState() => _FutureBuilderBodyState();
}

class _FutureBuilderBodyState extends State<FutureBuilderBody> {
  final _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext ctx, AsyncSnapshot<List<Stories>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const LoadingWidget();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return LoadErrorWidget(tip: snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return NewsListWidget(list: snapshot.data!);
            }
            return const LoadErrorWidget(tip: '暂无数据');
        }
      },
      future: _getNews(),
    );
  }

  Future<List<Stories>> _getNews() async {
    final response =
        await _dio.get('https://news-at.zhihu.com/api/4/news/before/20190523');
    final news = News.fromJson(response.data);
    return news.stories ?? [];
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 30,
        color: Colors.blue,
      ),
    );
  }
}

class LoadErrorWidget extends StatelessWidget {
  final String _tip;

  const LoadErrorWidget({Key? key, required String tip})
      : _tip = tip,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Loading error: $_tip'),
    );
  }
}

class NewsListWidget extends StatelessWidget {
  final List<Stories> _list;

  const NewsListWidget({Key? key, required List<Stories> list})
      : _list = list,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        final item = _list[index];
        return ListTile(
          leading: Image.network(
            item.images?.first ?? '',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          title: Text('${item.title}'),
        );
      },
      separatorBuilder: (ctx, index) => const Divider(),
      itemCount: _list.length,
    );
  }
}

class News {
  News({
    this.date,
    this.stories,
  });

  News.fromJson(dynamic json) {
    date = json['date'];
    if (json['stories'] != null) {
      stories = [];
      json['stories'].forEach((v) {
        stories?.add(Stories.fromJson(v));
      });
    }
  }

  String? date;
  List<Stories>? stories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    if (stories != null) {
      map['stories'] = stories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Stories {
  Stories({
    this.imageHue,
    this.title,
    this.url,
    this.hint,
    this.gaPrefix,
    this.images,
    this.type,
    this.id,
  });

  Stories.fromJson(dynamic json) {
    imageHue = json['image_hue'];
    title = json['title'];
    url = json['url'];
    hint = json['hint'];
    gaPrefix = json['ga_prefix'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    type = json['type'];
    id = json['id'];
  }

  String? imageHue;
  String? title;
  String? url;
  String? hint;
  String? gaPrefix;
  List<String>? images;
  num? type;
  num? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_hue'] = imageHue;
    map['title'] = title;
    map['url'] = url;
    map['hint'] = hint;
    map['ga_prefix'] = gaPrefix;
    map['images'] = images;
    map['type'] = type;
    map['id'] = id;
    return map;
  }
}
