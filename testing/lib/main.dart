import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:testing/widget.dart';

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
  // MapView mapView = new MapView();

  // List<Marker> markers = <Marker>[
  //   new Marker(
  //     "Hall Of The Red Earl",
  //     "Hall of the Red Earl",
  //     53.2710,
  //     -9.0537,
  //   ),
  //   new Marker("Lynch's Castle", "Lynch's Castle", 53.2722, -9.0533),
  //   new Marker("st. nicholas' collegiate church",
  //       "st. nicholas' collegiate church", 53.2727, -9.0539),
  //   new Marker("Kings Head", "Kings Head", 53.2722, -9.0533),
  //   new Marker("Eyre Square", "Eyre Square", 53.2747, -9.0500),
  // ];

  // displayMap() {
  //   mapView.show(new MapOptions(
  //     mapViewType: MapViewType.normal,
  //     showUserLocation: true,
  //     initialCameraPosition:
  //         new CameraPosition(new Location(53.2707, -9.0568), 15.0),
  //     title: "google map",
  //   ));

  //   mapView.onMapTapped.listen((tapped) {
  //     mapView.setMarkers(markers);
  //     mapView.zoomToFit(padding: 100);
  //   });
  // }

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
          new RaisedButton(
              child: Text('Hall Of The Red Earl'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _MyHallPageState()),
                );
                //MaterialPageRoute(builder: (context) => ));
              }),
          new MyKingsWidget(),
          new Container(
            child: RaisedButton(
                child: Text('Kings Head'),
                elevation: 7.8,
                onPressed: () {
                  //Navigator.pushNamed(context, MyHallPage.routeName);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Map()),
                  );
                }),
          ),
        ]));
  }
}

class _MyHallPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hall Of the Red Earl"),
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

class Map extends StatelessWidget {
  MapView mapView = new MapView();

  List<Marker> markers = <Marker>[
    new Marker(
      "Hall Of The Red Earl",
      "Hall of the Red Earl",
      53.2710,
      -9.0537,
    ),
    new Marker("Lynch's Castle", "Lynch's Castle", 53.2722, -9.0533),
    new Marker("st. nicholas' collegiate church",
        "st. nicholas' collegiate church", 53.2727, -9.0539),
    new Marker("Kings Head", "Kings Head", 53.2722, -9.0533),
    new Marker("Eyre Square", "Eyre Square", 53.2747, -9.0500),
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
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Google Maps"),
        ),
        body: displayMap());
  }
}
