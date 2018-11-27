import 'package:flutter/material.dart';

class Texty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Text("This Works"));
  }
}

class MyExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage("assets/explore.jpg");
    var image = new Image(image: assetsImage, width: 48.0, height: 48.0);
    return Container(child: image);
  }
}
