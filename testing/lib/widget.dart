import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage("images/explore.jpg");
    var image = new Image(image: assetsImage, width: 600.0, height: 250.0);
    return Container(child: image);
  }
}

class MyKingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImages = new AssetImage("images/kings.jpg");
    var image2 = new Image(image: assetsImages, width: 600.0, height: 250.0);
    return Container(child: image2);
  }
}
