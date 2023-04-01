import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBasicTexts(),
            _buildTextWithTextStyle(),
            _buildRichText(),
            _buildDefaultTextStyle(),
            _buildCustomFontTexts(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello World',
          textAlign: TextAlign.start,
        ),
        Text(
          "Hello world! I'm Jack. " * 4,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Text(
          'Hello World',
          textScaleFactor: 1.5,
        ),
        //  当Text内容超过一行时，设置textAlign才会生效
        Text(
          "Hello world! I'm Jack. " * 4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTextWithTextStyle() {
    return const Text(
      'Hello World',
      style: TextStyle(
        color: Colors.blue,
        backgroundColor: Colors.orange,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }

  Widget _buildRichText() {
    //  富文本
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'https://',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'www.google.com',
            style: TextStyle(color: Colors.blue),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(Icons.add),
          ),
        ],
      ),
      style: TextStyle(
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildDefaultTextStyle() {
    //  使用DefaultTextStyle，使子Text继承通用样式
    return DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.red,
        fontSize: 20,
      ),
      child: Column(
        children: const [
          Text('1'),
          Text('2'),
          Text(
            '3',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomFontTexts() {
    //  使用自定义字体
    //  1.pubspec.yaml中引用
    //  2.TextStyle中定义fontFamily
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Custom Font',
          style: TextStyle(fontFamily: 'Alkatra', fontSize: 20),
        ),
        Text(
          'Custom Font',
          style: TextStyle(fontFamily: 'DeliciousHandrawn', fontSize: 20),
        ),
      ],
    );
  }
}
