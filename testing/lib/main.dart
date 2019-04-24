import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:testing/widget.dart';
import 'dart:async';
import 'package:testing/hall.dart';
import 'package:testing/kings.dart';
import 'package:testing/lynchs.dart';
import 'package:testing/nicholas.dart';
import 'package:testing/brownes.dart';
import 'package:testing/walls.dart';
import 'package:testing/maps.dart';

var myKey = "AIzaSyDzLAc2Uos2XNBT26mMJRqQ33aHoSnF0oM";

void main() {
  MapView.setApiKey(myKey);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medieval Walking Tour',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MySplashPage(title: 'Flutter Demo Home Page'),
    );
  }
}

//first thing called when application is launched.
class MySplashPage extends StatefulWidget {
  MySplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySplashPageState createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    // times is set so that the splashscreen appears for 7 seconds when the application is first launched.
    //the application then launches the _myHomePageState .this is a stateful widget.
    Timer(
        Duration(seconds: 7),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _MyHomePageState()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(""),
          centerTitle: true,
        ),
        body: new ListView(children: <Widget>[
          new Text(
            "Medieval Walking Tour",
            textAlign: TextAlign.center,
            //determine size of font
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
          new Text(
            "Developers: Abigail Culkin and Sarah Carroll",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 15.0,
            ),
          ),
          new Image(
            image: AssetImage("images/guide.png"),
          ),
        ]));
  }
}

//home page stateless widget.
class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView(children: <Widget>[
      new Text(
        "Medieval Tour",
        textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 30.0,
        ),
      ),
      //call MyImageWidget for widget.dart.
      new MyImageWidget(),
      new RaisedButton(
          child: Text('Hall Of the Red Earl '),
          onPressed: () {
            //when button chicked navigate to myHallPage. this is a widget in hall.dart imported at top.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHallPage()),
            );
          }),
      new MyKingsWidget(),
      new RaisedButton(
          child: Text('Kings Head'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyKingsPage()),
            );
          }),
      new MyNicholasWidget(),
      new Container(
        child: RaisedButton(
            child: Text('St.Nicholas Church'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyNicholasPage()),
              );
            }),
      ),
      new MyLynchsWidget(),
      new RaisedButton(
          child: Text('Lynchs Castle'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyLynchPage()),
            );
          }),
      new MyBrownesWidget(),
      new RaisedButton(
          child: Text('Brownes Doorway'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBrownesPage()),
            );
          }),
      new MyWallWidget(),
      new RaisedButton(
          child: Text('Medieval Walls'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyWallPage()),
            );
          }),
      new RaisedButton(
          child: Text('Location'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Map1()),
            );
          }),
    ]));
  }
}
