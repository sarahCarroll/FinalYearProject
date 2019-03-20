import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyLynchPageUrl extends StatefulWidget {
  @override
  _MyLynchPageStateMore createState() => new _MyLynchPageStateMore();
}

class _MyLynchPageStateMore extends State<MyLynchPageUrl>{
 final String url = "http://35.189.123.3/data?";

  List data;

  Future<String> getJsonData() async {
    final response = await http.get(
        //encode the url
        Uri.encodeFull(url),
        //only accept json response
        headers: {"Content-Type": "application/json"});

     setState(() {
      var resBody = json.decode(response.body);
      data = resBody["multi"];
    });

    return "data";
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Lynchs Castle"),
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
                          child: Text(data[6]['description'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/lynch's/old.jpg")),
                          ),
                          height: 250.0,
                          width: 600.0,
                        ),
                        Card(
                            child: Container(
                          child: Text(data[7]['description'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/lynch's/sketch.jpg")),
                          ),
                          height: 250.0,
                          width: 600.0,
                        ),
                        Card(
                            child: Container(
                          child: Text(data[8]['description'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                  ]),
                ),
              );
            }));
  }
}

class MyLynchPage extends StatefulWidget {
  @override
  _MyLynchsPageState createState() => new _MyLynchsPageState();
}

class _MyLynchsPageState extends State<MyLynchPage> {
  final String url = "http://35.189.123.3/data?";
  List data;

  Future<String> getJsonData() async {
    final response = await http.get(
        //encode the url
        Uri.encodeFull(url),
        //only accept json response
        headers: {"Content-Type": "application/json"});

   setState(() {
      var resBody = json.decode(response.body);
      data = resBody["multi"];
    });

  
    return "data";
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
  }
  
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
                          child: Text(data[17]['description'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
              new RaisedButton(
              child: Text('More Info'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyLynchPageUrl()),
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
        ]),
                ),
              );
            }));
  }
}
