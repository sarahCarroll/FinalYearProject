import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:testing/widget.dart';
import 'package:map_view/figure_joint_type.dart';
import 'package:map_view/polygon.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapView mapView = new MapView();

  List<Marker> markers = <Marker>[
    new Marker("Hall Of The Red Earm", " ", 53.2710, -9.0537)
  ];

  displayMap() {
    mapView.show(new MapOptions(
      mapViewType: MapViewType.normal,
      showUserLocation: true,
      initialCameraPosition:
          new CameraPosition(new Location(53.2707, -9.0568), 15.0),
      title: "google map",
    ));

    mapView.onMapTapped.listen((tapped) {
      mapView.setMarkers(markers);
      mapView.zoomToFit(padding: 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
          centerTitle: true,
        ),
        body: new ListView(children: <Widget>[
          new MyImageWidget(),
          new Container(
            child: RaisedButton(
              child: Text('Hall Of The Red Earl Location'),
              color: Colors.purple,
              elevation: 7.8,
              onPressed: displayMap,
            ),
          ),
          new MyKingsWidget(),
          new Text("Kings Head",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}

// class MyHallPage extends StatefulWidget {
//   MyHallPage({Key key, this.title}) : super(key: key);

//   static const String routeName = "/MyHallPage";

//   final String title;

//   @override
//   _MyHallPageState createState() => new _MyHallPageState();
// }

// class _MyHallPageState extends State<MyHallPage> {
//   MapView mapView = new MapView();

//   displayMap() {
//     mapView.show(new MapOptions(
//       mapViewType: MapViewType.normal,
//       showUserLocation: true,
//       initialCameraPosition:
//           new CameraPosition(new Location(53.2707, -9.0568), 15.0),
//       title: "google map",
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return new Scaffold(
//         appBar: new AppBar(
//           // Here we take the value from the MyHomePage object that was created by
//           // the App.build method, and use it to set our appbar title.
//           title: new Text(widget.title),
//         ),
//         body: new ListView(children: <Widget>[
//           new MyImageWidget(),
//           new Text("Hall Of The Red Earl",
//               style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
//           new Text("This is all the information about the hall of the red earl",
//               style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
//           new RaisedButton(
//             child: Text('Location'),
//             onPressed: displayMap(),
//           )
//         ]));
//   }
// }
