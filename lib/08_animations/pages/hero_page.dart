import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Page'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 16 / 9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (ctx, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ImagePage(tag: index),
                    );
                  },
                ),
              );
            },
            child: Hero(
              //  本例仅用index表示tag
              tag: index,
              child: Image.asset(
                'assets/images/girl.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: 20,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  final Object _tag;

  const ImagePage({Key? key, required Object tag})
      : _tag = tag,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Image Page'),
      ),
      body: Center(
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: _tag,
            child: Image.asset('assets/images/girl.jpeg'),
          ),
        ),
      ),
    );
  }
}
