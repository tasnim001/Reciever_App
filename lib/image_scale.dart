import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageScaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scalable Image")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PhotoView(
          imageProvider: AssetImage('assets/image.jpg'),
          backgroundDecoration: BoxDecoration(color: Colors.white),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 3,
        ),
      ),
    );
  }
}
