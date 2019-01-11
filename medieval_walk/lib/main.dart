import 'package:flutter/material.dart';
import 'package:medieval_walk/widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      MyHallPage.routeName: (BuildContext context) => new MyHallPage(
            title: "MyHallPage",
          )
    };
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Medieval walking tour'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      Navigator.pushNamed(context, MyHallPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
          centerTitle: true,
        ),
        body: new ListView(children: <Widget>[
          new MyImageWidget(),
          new RaisedButton(
              child: Text('Hall Of The Red Earl'),
              onPressed: () {
                Navigator.pushNamed(context, MyHallPage.routeName);
                //MaterialPageRoute(builder: (context) => ));
              }),
          new Text("Hall Of The Red Earl",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new MyKingsWidget(),
          new Text("Kings Head",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}

class MyHallPage extends StatefulWidget {
  MyHallPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/MyHallPage";

  final String title;

  @override
  _MyHallPageState createState() => new _MyHallPageState();
}

class _MyHallPageState extends State<MyHallPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
        ),
        body: new ListView(children: <Widget>[
          new MyImageWidget(),
          new Text("Hall Of The Red Earl",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text("This is all the information about the hall of the red earl",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}
