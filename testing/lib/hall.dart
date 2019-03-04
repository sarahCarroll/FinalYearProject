import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class _MyHallPageStateMore extends StatelessWidget {
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
          new Text("MESSAGE- long getting info from db",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}

class MyHallPage extends StatefulWidget {
  @override
  _MyHallPageState createState() => new _MyHallPageState();
}

class _MyHallPageState extends State<MyHallPage> {
  final String url = "http://35.189.123.3/data?";
 // List data;
  Map<String, dynamic>  data;
  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
        //encode the url
        Uri.encodeFull(url),
        //only accept json response
        headers: {"Accept": "application/json"});

    //print(response.body);

    //loads when app page for displaying data is
    setState(() {
       data = json.decode(response.body);
    });

    print(data["title"]);
    //print(data["description"]);
   // print(data["body"]);

    // List data;
    // print(response.body);
    //print(data[0]["title"]);

    return "Success";
  }

  //https://www.youtube.com/watch?v=sC9qhNPvW1M
  int photoIndex = 0;

  List<String> photos = ["images/explore.jpg", "images/kings.jpg"];

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
          //data['title'] !=null? 
          title: new Text("Hall"), 
             ),
        body: 
          // Center(
          //     child: Stack(children: <Widget>[
          //   Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(image: AssetImage(photos[photoIndex])),
          //     ),
          //     height: 250.0,
          //     width: 600.0,
          //   )
          // ])),
          // Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          //   RaisedButton(child: Text('previous'), onPressed: _previousImage),
          //   RaisedButton(child: Text('next'), onPressed: _nextImage),
          // ]),
          new ListView.builder(
        itemCount: data == null? 0: data.length,
        itemBuilder: (BuildContext context , i){
          return new Container(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                     Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(photos[photoIndex])),
                        ),
                        height: 250.0,
                        width: 600.0,
                      ),
                       Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                    RaisedButton(child: Text('previous'), onPressed: _previousImage),
                    RaisedButton(child: Text('next'), onPressed: _nextImage),
                    ]),
                    Card(
                      child:Container(
                        child: Text(data['title'] ,
                          style:
                          TextStyle(fontSize: 18.0,
                            color: Colors.black54
                          )),
                      )
                    ),
              
                     
                 
            // title: Text(data['title']),  
            // subtitle: new Text(data['body']),
               
        
         
          // new Text(data['title'],
          //     style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
        
          //  new Text(
          //     "As one of the oldest sites in the medieval town of Galway, the Hall of the Red Earl is associated with the De Burgo family who founded the town in the 13th century. Within its walls, banquets were hosted, taxes were collected and justice was dispensed.",
          //     style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
           new RaisedButton(
              child: Text('More info'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _MyHallPageStateMore()),
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
          
           ), );
        }));
              }
           }