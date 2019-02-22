import 'package:flutter/material.dart';
import 'package:testing/widget.dart';
import 'package:testing/maps.dart';

class _MyKingsPageStateMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Kings Head"),
        ),
        body: new ListView(children: <Widget>[
          new MyImageWidget(),
          new Text("Kings Head",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text(
              "While the famous 17th century Pictorial Map of Galway depicts a three storey residence adjoining a five storey building known as Bank’s Castle on the site of the present-day pub, archaeological evidence has shown, however, that a building probably existed there as far back as the 13th century. A number of features from the medieval building can still be seen in the premises. These include walls and windows while an impressive fireplace, which dates from 1612 and bears the family arms of three of the Tribe families greets customers on arrival.As suggested by the name, the building is famous for an association with the beheading of the king of England in 1649. Following the siege of Galway in 1652, it was seized by the notorious Cromwellian leader, Colonel Peter Stubbers from the mayor of Galway, Tomás Lynch Fitz-Ambrose. Stubbers appointed himself as the town’s military governor and according to legend, was equally feared and hated by the townspeople. Stubbers was involved in some way in the execution of King Charles I during England’s bloody Civil War (1642-49) which pitted Cromwell’s Parliamentarians against the monarchy. Some historians believe Stubbers wielded the axe which removed the King’s head from his body, while others think he was instrumental in finding an Irish executioner named Richard Gunning to do the dirty work. In any case, following the restoration of Charles II to the throne in 1660, Stubbers found himself a wanted man and made himself so scarce, he was never heard of again.Another interesting feature is located over the doorway of the building directly opposite The King’s Head. Known as an ‘armorial stone’, this is a carving dating back to 1615 which bears the crests of the two tribe families - the Ffrenches and the Ffonts. Such stones were often carved to mark a marriage between Tribe families and typically carried the initials of the bride and groom. In this case AF and MF. Indeed, it is well worth keeping a look out for various medieval insignias, plaques and architectural features on the city’s buildings as you wander around. You’re never too far away from one",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
        ]));
  }
}

class MyKingsPage extends StatefulWidget {
  @override
  _MyKingsPageState createState() => new _MyKingsPageState();
}

class _MyKingsPageState extends State<MyKingsPage> {
  //https://www.youtube.com/watch?v=sC9qhNPvW1M
  int photoIndex = 0;

  List<String> photos = ["images/kings.jpg", "images/lynchs.jpg"];

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
          title: new Text("Kings Head"),
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
          new Text("Kings Head",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),
          new Text(
              "(Please note that entry to this site is subject to opening hours).The King’s Head is located on High Street (known as Gaol Street in medieval times) and is one of Galway’s best known pubs. There is a long-standing local tradition that the building which houses the pub was strongly associated with the executioner of King Charles I in 1649.",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
          new RaisedButton(
              child: Text('More Info'),
              onPressed: () {
                //Navigator.pushNamed(context, MyHallPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _MyKingsPageStateMore()),
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
