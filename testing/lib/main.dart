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
    Timer(
        Duration(seconds: 5),
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
          ),
          new Text(
            "athors: Abigail Culkin and Sarah Carroll",
            textAlign: TextAlign.center,
          )
        ]));
  }
}

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
      new MyImageWidget(),
      new RaisedButton(
          child: Text('Hall Of the Red Earl '),
          onPressed: () {
            //Navigator.pushNamed(context, MyHallPage.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHallPage()),
            );
            //MaterialPageRoute(builder: (context) => ));
          }),
      new MyKingsWidget(),
      new RaisedButton(
          child: Text('Kings Head'),
          onPressed: () {
            //Navigator.pushNamed(context, MyHallPage.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyKingsPage()),
            );
            //MaterialPageRoute(builder: (context) => ));
          }),
      new MyNicholasWidget(),
      new Container(
        child: RaisedButton(
            child: Text('St.Nicholas Church'),
            elevation: 7.8,
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
            //Navigator.pushNamed(context, MyHallPage.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyLynchPage()),
            );
            //MaterialPageRoute(builder: (context) => ));
          }),
      new MyBrownesWidget(),
      new RaisedButton(
          child: Text('Brownes Doorway'),
          onPressed: () {
            //Navigator.pushNamed(context, MyHallPage.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBrownesPage()),
            );
            //MaterialPageRoute(builder: (context) => ));
          }),
      new MyWallWidget(),
      new RaisedButton(
          child: Text('Medieval Walls'),
          onPressed: () {
            //Navigator.pushNamed(context, MyHallPage.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyWallPage()),
            );
            //MaterialPageRoute(builder: (context) => ));
          }),
    ]));
  }
}
