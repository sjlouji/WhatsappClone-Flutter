import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatsappclone/Screens/HomePage.dart';
import 'package:whatsappclone/Widget/Avatar.dart';
import 'package:whatsappclone/Data/Status.dart';

void main() {
  runApp(StatusScreen());
}

class StatusScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StatusPage();
  }
}

class StatusPage extends StatefulWidget {
  StatusPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusPage> {



  final decoratorsOutline = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.blue[300], Colors.blueAccent[200],]),
    border: Border.all(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(32),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                new ListTile(
                  leading: Avatar(profileAvatarImage: "https://img1.looper.com/img/gallery/audi-may-have-spoiled-who-saves-tony-stark-in-avengers-4/intro-1547480934.jpg",user: true),
                  title: Column(
                    children: [
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            "My Status",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text("Tap to add status update"),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.grey[300],
              height: 27,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text('View updates', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[600]),)
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: statusList.length,
                itemBuilder: (context, i) => new Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 70),
                      child: new Divider(
                        height: 10.0,
                      ),
                    ),
                    new ListTile(
                      leading:Container(

                        decoration: statusList[i].seen?null:decoratorsOutline,
                        child: Container(
                          padding: EdgeInsets.all(
                            2,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
//                        ),
                            child: FadeInImage(
                              image: NetworkImage(statusList[i].statusImage),
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                              placeholder: NetworkImage("https://i.ytimg.com/an_webp/g6ByRLzpoIc/mqdefault_6s.webp?du=3000&sqp=CKfPmfoF&rs=AOn4CLBdZjKxdiSAvJf9i0DGXZ8josn3CQ"),
                            ),
                          ),
                        ),
                      ),
                      title: Column(
                        children: [
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                statusList[i].name,
                                style: new TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: new Container(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(statusList[i].time),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                    MdiIcons.pencil,
                  color: Color(0xFF285C55),
                ),
                onPressed: () {
                  //...
                },
                heroTag: null,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                backgroundColor: Color(0xFF5CC856),
                child: Icon(
                    MdiIcons.camera
                ),
                heroTag: null,
              )
            ]
        )
    );
  }


}
