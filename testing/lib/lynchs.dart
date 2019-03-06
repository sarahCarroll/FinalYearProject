import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';

class _MyLynchPageStateMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Lynchs Castle"),
        ),
        body: new ListView(children: <Widget>[
          new MyLynchsWidget(),
          new Text("Lynchs Castle",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text(
              "The castle is located on the junction of Shop Street and Upper Abbeygate Street and is thought to date to the late 15th or early 16th century. The stylish carvings and architectural features on the castle are symbols of the wealth and influence of the Lynch family. In fact, this family held the office of Mayor of Galway on 84 occasions between the granting of mayoral status to the town in 1484 and the arrival of conquering Cromwellian forces in 1652.",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}

class MyLynchPage extends StatefulWidget {
  @override
  _MyLynchsPageState createState() => new _MyLynchsPageState();
}

class _MyLynchsPageState extends State<MyLynchPage> {
  //https://www.youtube.com/watch?v=sC9qhNPvW1M
  int photoIndex = 0;

  List<String> photos = [
      "images/lynch's/lynchs(1).jpg",
      "images/lynch's/lynchs(2).jpg",
      "images/lynch's/lynchs(3).jpg"
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
          title: new Text("Lynchs Castle"),
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
                      builder: (context) => _MyLynchPageStateMore()),
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
