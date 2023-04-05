import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatelessWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Page'),
      ),
      body: const ImagePickerBody(),
    );
  }
}

class ImagePickerBody extends StatefulWidget {
  const ImagePickerBody({Key? key}) : super(key: key);

  @override
  State<ImagePickerBody> createState() => _ImagePickerBodyState();
}

class _ImagePickerBodyState extends State<ImagePickerBody> {
  XFile? _image = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _showActionSheet(context),
          child: const Text('选择单张图片'),
        ),
        _buildImage(),
      ],
    );
  }

  Widget _buildImage() {
    if (_image == null) {
      return const Text('请选择');
    }
    return Image.file(
      File(_image!.path),
      gaplessPlayback: true,
    );
  }

  void _showActionSheet(BuildContext context) async {
    final ImageSource? imageSource = await showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return CupertinoActionSheet(
          title: const Text('选择图片'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              isDefaultAction: true,
              child: const Text('从相册'),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              isDefaultAction: true,
              child: const Text('从相机'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true,
            child: const Text('取消'),
          ),
        );
      },
    );

    if (imageSource != null) {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: imageSource);
      setState(() {
        _image = image;
      });
    }
  }
}
