import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{

  final String profileAvatarImage;
  final bool user;
  final bool seen;

  const Avatar({
    Key key,
    @required this.profileAvatarImage,
    @required this.user,
    this.seen
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(0),
      child: Stack(
          children: [

            CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(profileAvatarImage),
            ),
            user?
            Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  child: Icon(Icons.add, size: 13, color: Colors.white,),
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF50b525),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            )
                :
                SizedBox.shrink()
          ]
      ),
    );
  }

}