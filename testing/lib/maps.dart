import 'package:flutter/material.dart';
import 'dart:async';
import 'package:map_view/map_view.dart';
import 'package:map_view/polygon.dart';
import 'package:map_view/polyline.dart';

class Map1 extends StatelessWidget {
  MapView mapView = new MapView();

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

  displayMap() {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            initialCameraPosition:
                new CameraPosition(new Location(53.2707, -9.0568), 15.0),
            title: "Recently Visited"),
        toolbarActions: [new ToolbarAction("Close", 0)]);

    List<Polygon> polygons = <Polygon>[
      new Polygon(
          "Nice one",
          <Location>[
            new Location(53.2710, -9.0537),
            new Location(53.2722, -9.0533),
            new Location(53.2727, -9.0539),
            new Location(53.2732, -9.0523),
            new Location(53.2747, -9.0500),
            new Location(53.2738, -9.0507),
          ],
          //jointType: FigureJointType.round,
          strokeColor: Colors.blue,
          strokeWidth: 10.0,
          fillColor: Colors.blue.withOpacity(0.1))
    ];

    mapView.onMapTapped.listen((tapped) {
      mapView.setMarkers(markers);
      mapView.zoomToFit(padding: 100);
      mapView.setPolygons(polygons);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("press back"),
        ),
        body: new ListView(children: <Widget>[
          displayMap(),
          new Text("press back to go back to previous page")
        ]));
  }
}
