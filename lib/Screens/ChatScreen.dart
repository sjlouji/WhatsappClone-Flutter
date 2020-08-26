import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatsappclone/Data/Chat.dart';
import 'package:whatsappclone/Widget/Avatar.dart';

void main() {
  runApp(ChatScreen());
}

class ChatScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChatPage();
  }
}

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  ListView.builder(
          padding: EdgeInsets.only(bottom: 100),
          itemCount: chatList.length,
          itemBuilder: (context, i) => new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 70),
                child: new Divider(
                  height: 10.0,
                ),
              ),
              new ListTile(
                leading: Avatar(profileAvatarImage: chatList[i].userImage,user: false,),
                title: Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          chatList[i].name,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            new Text(
                              chatList[i].time,
                              style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                            chatList[i].noUnseenmsg !=0?
                            Container(
                              height: 25.0,
                              width: 25.0,
                              child: Center(
                                child: Text(
                                  chatList[i].noUnseenmsg.toString(),
                                  style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w500),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF61CF71),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                            ):
                                SizedBox.shrink(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: _text(chatList[i].lastMesssageType, chatList[i].message, chatList[i].recieved, chatList[i].seen),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5CC856),
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
  _text(String messageType, String message, bool rec, bool seen){
    if(messageType == "message"){
      return Row(
        children: [
          Container(
            child: Row(
              children: [
                Icon(rec?MdiIcons.checkAll:MdiIcons.check,size: 15,color: seen?Colors.blue:Colors.grey[600],),
              ],
            ),
          ),
          new Text(
              message,
              style: new TextStyle(color: Colors.grey, fontSize: 15.0),
          ),
        ],
      );
    }else if(messageType == "voice"){
      return Container(
        child: Row(
          children: [
            Icon(Icons.keyboard_voice,size: 20,color: Color(0XFF5DB8F6),),
            SizedBox(width: 7,),
            Text(message),
          ],
        ),
      );
    }else if(messageType == "file"){
      return Container(
        child: Row(
          children: [
            Icon(Icons.insert_drive_file,size: 17,color: Colors.grey[700],),
            SizedBox(width: 7,),
            Text(message),
          ],
        ),
      );
    }else {
      return new Text(
        message,
        style: new TextStyle(color: Colors.grey, fontSize: 15.0),
      );
    }
  }
}

