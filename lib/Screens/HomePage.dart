import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatsappclone/Screens/CallScreen.dart';
import 'package:whatsappclone/Screens/CameraScreen.dart';
import 'package:whatsappclone/Screens/ChatScreen.dart';
import 'package:whatsappclone/Screens/StatusScreen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: "hello",);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  final TrackingScrollController scrollController = TrackingScrollController();
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this, initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF285C55),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: NestedScrollView(

              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: SliverAppBar(
                      actions: [
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.search),
                              SizedBox(width: 15,),
                              Icon(Icons.more_vert),
                            ],
                          ),
                        )
                      ],
                      pinned: false,
                      elevation: 0,
                      backgroundColor: Color(0xFF285C55),
                      title: Text("WhatsApp"),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        controller: controller,
                        unselectedLabelColor: Color(0xFF8CAAAB),
                        indicatorColor: Colors.white,
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        tabs: [
                          Container(
                            width: 50,
                            child: Tab(
                                icon: Icon(MdiIcons.camera, size: 25,)
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Tab(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('CHATS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 5,),
                                  Container(
                                    height: 22.0,
                                    width: 22.0,
                                    child: Center(
                                      child: Text(
                                        "12",
                                        style: TextStyle(color: Color(0xFF285C55),fontSize: 12, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Tab(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('STATUS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 5,),
                                  Container(
                                    height: 7.0,
                                    width: 7.0,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(color: Color(0xFF285C55),fontSize: 12, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Tab(
                              child: Text('CALLS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
                body: TabBarView(
                  controller: controller,
                  children: [
                    Container(
                      color: Colors.white,
                      child: CameraScreen(),
                    ),
                    Container(
                      color: Colors.white,
                      child: ChatScreen(),
                    ),
                    Container(
                      color: Colors.white,
                      child: StatusScreen(),
                    ),
                    Container(
                      color: Colors.white,
                      child: CallScreen(),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Color(0xFF285C55),
      margin: EdgeInsets.only(top: 0),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

