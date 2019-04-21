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
    var assetsImages = new AssetImage("images/kings/King(1).JPG");
    var image2 = new Image(image: assetsImages, width: 600.0, height: 250.0);
    return Container(child: image2);
  }
}

class MyNicholasWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImages = new AssetImage("images/nicholas.jpg");
    var image3 = new Image(image: assetsImages, width: 600.0, height: 250.0);
    return Container(child: image3);
  }
}

class MyLynchsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImages = new AssetImage("images/lynchs.jpg");
    var image4 = new Image(image: assetsImages, width: 600.0, height: 250.0);
    return Container(child: image4);
  }
}

class MyBrownesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImages = new AssetImage("images/brownes.jpg");
    var image5 = new Image(image: assetsImages, width: 600.0, height: 250.0);
    return Container(child: image5);
  }
}

class MyWallWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImages = new AssetImage("images/walls.jpg");
    var image6 = new Image(image: assetsImages, width: 600.0, height: 250.0);
    return Container(child: image6);
  }
}
