import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

class MyKingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImages = new AssetImage("assets/kings.jpg");
    var image2 = new Image(image: assetsImages, width: 550.0, height: 412.0);
    return Container(child: image2);
  }
}
