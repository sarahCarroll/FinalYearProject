import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class MyWallPageUrl extends StatefulWidget {
  @override
  _MyWallsPageStateMore createState() => new _MyWallsPageStateMore();
}
class _MyWallsPageStateMore extends State<MyWallPageUrl>  {
 
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
          title: new Text("Medieval Walls"),
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
                          child: Text(data[14]['description'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/walls/walls(3).JPG")),
                          ),
                          height: 250.0,
                          width: 600.0,
                        ),
                        Card(
                            child: Container(
                          child: Text(data[9]['description'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/walls/walls(1).JPG")),
                          ),
                          height: 250.0,
                          width: 600.0,
                        ),
                  ]),
                ),
              );
            }));
  }
}

class MyWallPage extends StatefulWidget {
  @override
  _MyWallsPageState createState() => new _MyWallsPageState();
}

class _MyWallsPageState extends State<MyWallPage> {
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
      "images/walls/walls(1).JPG",
      "images/walls/walls(2).jpg",
      "images/walls/walls(3).JPG"
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
          title: new Text("Medieval Walls"),
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
                          child: Text(data[19]['description'],
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
                      builder: (context) => MyWallPageUrl()),
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