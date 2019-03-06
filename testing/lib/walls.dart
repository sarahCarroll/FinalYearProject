import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';

class _MyWallsPageStateMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Medieval Walls"),
        ),
        body: new ListView(children: <Widget>[
          new MyWallWidget(),
          new Text("Medieval Walls",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text("walls",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}

class MyWallPage extends StatefulWidget {
  @override
  _MyWallsPageState createState() => new _MyWallsPageState();
}

class _MyWallsPageState extends State<MyWallPage> {
  //https://www.youtube.com/watch?v=sC9qhNPvW1M
  int photoIndex = 0;

  List<String> photos = [
      "images/walls/walls(1).JPG",
      "images/walls/walls(2).jpg",
      "images/walls/walls(3).JPG"
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Medieval Walls"),
        ),
        body: new ListView(children: <Widget>[
          Center(
              child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(photos[photoIndex])),
              ),
              height: 250.0,
              width: 600.0,
            )
          ])),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            RaisedButton(child: Text('previous'), onPressed: _previousImage),
            RaisedButton(child: Text('next'), onPressed: _nextImage),
          ]),
          new Text("Kings Head",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text(
              "Lynch’s Castle is the finest surviving example of an urban tower-house in Ireland and is the oldest building in continuing commercial use in Ireland. It was home to the most powerful of the Tribe families of Galway and is situated at the very centre of the old medieval town.",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
          new RaisedButton(
              child: Text('More Info'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _MyWallsPageStateMore()),
                );
                //MaterialPageRoute(builder: (context) => ));
              }),
          new RaisedButton(
              child: Text('Location'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Map1()),
                );
                //MaterialPageRoute(builder: (context) => ));
              }),
        ]));
  }
}
