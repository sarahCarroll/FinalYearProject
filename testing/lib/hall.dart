import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class MyHallPageUrl extends StatefulWidget {
  @override
  _MyHallPageStateMore createState() => new _MyHallPageStateMore();
}
class _MyHallPageStateMore extends State<MyHallPageUrl> {
final String url = "http://35.189.123.3/data?";

  Map<String, dynamic> data;

  Future<String> getJsonData() async {
    final response = await http.get(
        //encode the url
        Uri.encodeFull(url),
        //only accept json response
        headers: {"Content-Type": "application/json"});

    setState(() {
      data = json.decode(response.body);
      assert(data != null);
    });

    print(data['body']);
    return "data";
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hall Of the Red Earl"),
        ),
         body: new ListView.builder(
            itemCount: data == null ? 0 : 1,
            itemBuilder: (BuildContext context, i) {
              return new Container(
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Card(
                            child: Container(
                          child: Text(data['body'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                        Card(
                            child: Container(
                          child: Text(data['body1'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/Hall/Hall(3).png")),
                          ),
                          height: 250.0,
                          width: 600.0,
                        ),
                        Card(
                            child: Container(
                          child: Text(data['body2'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                  ]),
                ),
              );
            }));
  }
}

class MyHallPage extends StatefulWidget {
  @override
  _MyHallPageState createState() => new _MyHallPageState();
}

class _MyHallPageState extends State<MyHallPage> {
  final String url = "http://35.189.123.3/data?";
  // List data;
  Map<String, dynamic> data;
  //var data;

  Future<String> getJsonData() async {
    final response = await http.get(
        //encode the url
        Uri.encodeFull(url),
        //only accept json response
        headers: {"Content-Type": "application/json"});

    //print(response.body);

    setState(() {
      data = json.decode(response.body);
      assert(data != null);
    });

    print(data['title']);

    return "data";
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
    // print(data);
  }

  //https://www.youtube.com/watch?v=sC9qhNPvW1M
  int photoIndex = 0;

  List<String> photos = [
    "images/Hall/Hall(1).JPG",
    "images/Hall/Hall(2).JPG",
    "images/Hall/Hall(3).png",
    "images/Hall/Hall(4).png"
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

  final int count = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hall of the Red Earl"),
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : 1,
            itemBuilder: (BuildContext context, i) {
              return new Container(
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(photos[photoIndex])),
                          ),
                          height: 250.0,
                          width: 600.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  child: Text('previous'),
                                  onPressed: _previousImage),
                              RaisedButton(
                                  child: Text('next'), onPressed: _nextImage),
                            ]),        
                        Card(
                            child: Container(
                          child: Text(data['description'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                       
                        new RaisedButton(
                            child: Text('More info'),
                            onPressed: () {
                              //Navigator.pushNamed(context, MyHallPage.routeName);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MyHallPageUrl()),
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
                            }),
                        //MaterialPageRoute(builder: (context) => ))
                      ]),
                ),
              );
            }));
  }
}
