import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';

class _MyBrownesPageStateMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Brownes Doorway"),
        ),
        body: new ListView(children: <Widget>[
          new MyBrownesWidget(),
          new Text("Brownes Doorway",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text("brownes doorway",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}

class MyBrownesPage extends StatefulWidget {
  @override
  _MyBrownesPageState createState() => new _MyBrownesPageState();
}

class _MyBrownesPageState extends State<MyBrownesPage> {
  //https://www.youtube.com/watch?v=sC9qhNPvW1M
  int photoIndex = 0;

  List<String> photos = ["images/brownes.jpg"];

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
          title: new Text("Brownes Doorway"),
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
          new Text("Brownes Doorway",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text("brownes doorway",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
          new RaisedButton(
              child: Text('More Info'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _MyBrownesPageStateMore()),
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
