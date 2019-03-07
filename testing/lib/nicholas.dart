import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class MyStPageUrl extends StatefulWidget {
  @override
  _MyNicholasPageStateMore createState() => new _MyNicholasPageStateMore();
}
class _MyNicholasPageStateMore extends State<MyStPageUrl> {
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
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("St.Nicholas Church"),
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
                          child: Text(data['bodySt'],
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
                          child: Text(data['bodySt2'],
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
                          child: Text(data['bodySt3'],
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
                          child: Text(data['bodySt4'],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )),
                  ]),
                ),
              );
            }));
  }
}

class MyNicholasPage extends StatefulWidget {
  @override
  _MyNicholasPageState createState() => new _MyNicholasPageState();
}

class _MyNicholasPageState extends State<MyNicholasPage> {
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

    print(data['title']);

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
      "images/nicks/Nicks(1).jpg",
      "images/nicks/Nicks(2).jpg",
      "images/nicks/Nicks(3).JPG",
      "images/nicks/Nicks(4).jpg"
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
          title: new Text("St.Nicholas Church"),
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
                          child: Text(data['descSt'],
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
                      builder: (context) => MyStPageUrl()),
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
