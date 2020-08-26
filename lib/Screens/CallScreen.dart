import 'package:flutter/material.dart';
import 'package:whatsappclone/Data/Call.dart';
import 'package:whatsappclone/Screens/HomePage.dart';
import 'package:whatsappclone/Widget/Avatar.dart';

void main() {
  runApp(CallScreen());
}

class CallScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CallPage();
  }
}

class CallPage extends StatefulWidget {
  CallPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  ListView.builder(
          itemCount: callList.length,
          itemBuilder: (context, i) => new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 70),
                child: new Divider(
                  height: 10.0,
                ),
              ),
              new ListTile(
                leading: Avatar(profileAvatarImage: callList[i].userImage,user: false,),
                title: Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          callList[i].name,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            callList[i].cal?
                                  Icon(Icons.call, color: Color(0xFF285C55),)
                                :
                                  Icon(Icons.videocam, color: Color(0xFF285C55),)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: _message(callList[i].callrecieved, callList[i].cal, callList[i].time, callList[i].callMissed),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5CC856),
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      ),
    );
  }

  _message(bool callrecieved, bool call, String time, bool callmissed){
    return Row(
      children: [
        Container(
          child: Icon(callrecieved?Icons.call_received:Icons.call_made, size: 17,color: callmissed?Colors.red:Colors.green[500],),
        ) ,
        Container(
          child: Text(time),
        ),
      ],
    );
  }
}
