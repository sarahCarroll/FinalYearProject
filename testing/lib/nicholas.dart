import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';

class _MyNicholasPageStateMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("St.Nicholas Church"),
        ),
        body: new ListView(children: <Widget>[
          new MyNicholasWidget(),
          new Text("St.Nicholas Church",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text(
              "(Please note that entry to this site is subject to opening hours).St Nicholas’ Church is the largest medieval church in constant use in Ireland and retains some wonderful features from that period. Dedicated to St Nicholas, the patron saint of sailors, it was visited from no less a sea-farer than Christopher Columbus who stopped by to say a few prayers in 1477.",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}

class MyNicholasPage extends StatefulWidget {
  @override
  _MyNicholasPageState createState() => new _MyNicholasPageState();
}

class _MyNicholasPageState extends State<MyNicholasPage> {
  //https://www.youtube.com/watch?v=sC9qhNPvW1M
  int photoIndex = 0;

  List<String> photos = ["images/nicholas.jpg"];

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
        body: new ListView(children: <Widget>[
          Center(
              child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(photos[photoIndex])),
              ),
              height: 250.0,
              width: 600.0,
            )
          ])),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            RaisedButton(child: Text('previous'), onPressed: _previousImage),
            RaisedButton(child: Text('next'), onPressed: _nextImage),
          ]),
          new Text("St.Nicholas Church",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text(
              "The church was built in 1320, probably on the site of an earlier church, and is located just off the western end of Shop Street. The church is dedicated to St Nicholas who was more commonly associated as the patron saint of sailors in medieval times but is probably best known as ‘Santa Claus’ today. Numerous churches in seaport towns such as Galway are dedicated to the saint. One particularly famous sailor is thought to have worshipped at the church: in 1477 Christopher Columbus paid a visit to Galway. The church was originally linked to a Cistercian order but gained ‘collegiate’ status when the town received its royal charter in 1484. This meant that it was then run by a ‘college’ of 8 vicars and a warden who were accountable directly to the Pope. During 16th and 17th centuries the church swung between the Catholic and Protestant faiths. In the years after the sacking of the town by Cromwellian forces in 1652, however, the church fell firmly under the control of new Protestant settlers. Today it continues to operate under the auspices of the Anglican Church of Ireland.",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
          new RaisedButton(
              child: Text('More Info'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _MyNicholasPageStateMore()),
                );
                //MaterialPageRoute(builder: (context) => ));
              }),
          new RaisedButton(
              child: Text('Location'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Map()),
                );
                //MaterialPageRoute(builder: (context) => ));
              }),
        ]));
  }
}
