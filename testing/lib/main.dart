import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:testing/widget.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


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

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: new AppBar(
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: new Text("widget.title"),
        //   centerTitle: true,
        // ),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Map()),
              );
            }),
      ),
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
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hall Of the Red Earl"),
        ),
        body: new ListView(children: <Widget>[
          displayMap(),
        ]));
  }
}

class _MyHallPageStateDB extends StatefulWidget{
  @override
_MyHallPageStateMore createState() => new _MyHallPageStateMore(); 
}

class _MyHallPageStateMore extends State<_MyHallPageStateDB> {
 final String url = "http://35.189.123.3/data?";
 List info;
  
  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(
      //encode the url
      Uri.encodeFull(url),
      //only accept json response
      headers: {"Accept": "application/json"}
    );

    print(response.body);

   setState((){
      var convertDataToJson = jsonDecode(response.body);
      info = convertDataToJson['data'];
    });

     return "Success";
  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hall Of the Red Earl"),
        ), //AppBar
        body: new ListView(children: <Widget>[
          new MyImageWidget(),
          new Text("Hall Of The Red Earl",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text("MESSAGE- long getting info from db",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
  
  ]));
  }
}


//  new Text(data[index]['info']),
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
          new Text(
              "As one of the oldest sites in the medieval town of Galway, the Hall of the Red Earl is associated with the De Burgo family who founded the town in the 13th century. Within its walls, banquets were hosted, taxes were collected and justice was dispensed.",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
          new RaisedButton(
              child: Text('Hall Of The Red Earl'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _MyHallPageStateDB()),
                );
                //MaterialPageRoute(builder: (context) => ));
              }),
        ]));
  }
}
