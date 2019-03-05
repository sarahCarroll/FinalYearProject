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
    //print(data["description"]);
   // print(data["body"]);

    // List data;
    // print(response.body);
    //print(data[0]["title"]);

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
final int count =1;


  @override
  Widget build(BuildContext context) {
   // getJsonData();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hall"), 
             ),
             
        body: 
          new ListView.builder(
             
        itemCount: data == null? 0: 1 ,
        itemBuilder: (BuildContext context , i){
        // FutureBuilder<String>(
        //   future: getJsonData(),
        //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        //       if (snapshot.hasData) {
        //           print('itemNo in FutureBuilder: ${snapshot.data}');
        //           return Text('Hello');
        //        } 
        //    },
        //        );
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