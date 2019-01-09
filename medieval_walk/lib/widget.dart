import 'package:flutter/material.dart';

class Texty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Text("This Works"));
  }
}

class MyImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage("assets/explore.jpg");
    var image = new Image(image: assetsImage, width: 550.0, height: 412.0);
    return Container(child: image);
  }
}
