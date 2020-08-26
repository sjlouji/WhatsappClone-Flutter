import 'package:flutter/material.dart';
import 'package:whatsappclone/Screens/HomePage.dart';

void main() {
  runApp(CameraScreen());
}

class CameraScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CameraPage();
  }
}

class CameraPage extends StatefulWidget {
  CameraPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Camera Screen'),
      ),
    );
  }
}
