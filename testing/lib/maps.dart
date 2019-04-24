import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/polyline.dart';
//import 'package:testing/Tool.dart';

class Map1 extends StatelessWidget {
  MapView mapView = new MapView();

  //http://tphangout.com/flutter-google-maps-markers-and-polygons/
  List<Marker> markers = <Marker>[
    new Marker(
      "Hall Of The Red Earl",
      "Hall of the Red Earl",
      53.2710,
      -9.0537,
    ),
    new Marker("Lynch's Castle", "Lynch's Castle", 53.2732, -9.0523),
    new Marker("st. nicholas' collegiate church",
        "st. nicholas' collegiate church", 53.2727, -9.0539),
    new Marker("Kings Head", "Kings Head", 53.2722, -9.0533),
    new Marker("Eyre Square", "Eyre Square", 53.2747, -9.0500),
    new Marker("Medieval Walls", "Medieval Walls", 53.2738, -9.0507),
  ];

  //https://pub.dartlang.org/packages/map_view
  displayMap() {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            initialCameraPosition:
                new CameraPosition(new Location(53.2707, -9.0568), 15.0),
            title: "tap map"),
        toolbarActions: [new ToolbarAction("Close", 0)]);

    //https://stackoverflow.com/questions/53171531/how-to-add-polyline-on-google-maps-flutter-plugin
    List<Polyline> polygons = <Polyline>[
      new Polyline(
        "Nice one",
        <Location>[
          new Location(53.2710, -9.0537),
          new Location(53.2722, -9.0533),
          new Location(53.2727, -9.0539),
          new Location(53.2732, -9.0523),
          new Location(53.2747, -9.0500),
          new Location(53.2738, -9.0507),
        ],
        width: 15.0,
        color: Colors.blue[200],
      )
    ];

    //https: //pub.dartlang.org/packages/map_view
    mapView.onMapTapped.listen((tapped) {
      mapView.setMarkers(markers);
      mapView.zoomToFit(padding: 30);
      mapView.setPolylines(polygons);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Google Maps'),
      ),
      body: new Center(
        child: Container(
          child: RaisedButton(
            child: Text('Tap me to display map'),
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 7.0,
            onPressed: displayMap,
          ),
        ),
      ),
    );
  }
}
