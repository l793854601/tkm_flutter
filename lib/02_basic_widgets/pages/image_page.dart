import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Page',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBasicImages(),
            _buildFadeInImage(),
            _buildIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicImages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  加载本地图片
        const Image(
          image: AssetImage('assets/images/avatar.jpeg'),
          width: 200,
          height: 200,
        ),
        Image.asset(
          'assets/images/girl.jpeg',
          width: 300,
        ),
        //  加载网络图片
        const Image(
          image: NetworkImage(
            'https://picx.zhimg.com/v2-661fe7beeaf99c97eb052b084ba72236_1440w.jpg?source=172ae18b',
          ),
          width: 200,
          height: 200,
        ),
        Image.network(
          'https://pic1.zhimg.com/80/v2-6f040534f33fac21ec734f2645a7a970_1440w.webp',
          height: 200,
        ),
        const Image(
          image: AssetImage('assets/images/avatar.jpeg'),
          width: 300,
          height: 200,
          color: Colors.blue,
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
        ),
      ],
    );
  }

  Widget _buildFadeInImage() {
    return FadeInImage(
      imageErrorBuilder: (ctx, error, stackTrace) => Image.asset(
        'assets/images/nav_icon_avatar_nor.png',
      ),
      placeholder: const AssetImage(
        'assets/images/nav_icon_avatar_nor.png',
      ),
      image: const NetworkImage(
        'https://picx.zhimg.com/v2-661fe7beeaf99c97eb052b084ba72236_1440w.jpg?source=172ae18b',
      ),
      width: 200,
      height: 200,
      fadeInCurve: Curves.linear,
      fadeOutCurve: Curves.linear,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeOutDuration: const Duration(milliseconds: 500),
    );
  }

  Widget _buildIcons() {
    return Column(
      children: const [
        Icon(
          Icons.pets,
          color: Colors.cyan,
          size: 50,
        ),
        Text(
          '\ue4a1',
          style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 50,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
