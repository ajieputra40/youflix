import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtap/pages/profile_page.dart';
import 'package:youtap/pages/tv_page.dart';

import 'movies_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  String? page;
  bool shouldPop = false;
  int _selectedIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> pages = [
    MoviesPage(),
    TvPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }



  Widget home(){
    Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
      onTap: (int index) => setState(() => _selectedIndex = index),
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF1caed4),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            MdiIcons.movieRoll,
            size: 28, //Icon Size
          ),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            MdiIcons.televisionBox,
            size: 28, //Icon Size
          ),
          label: 'Televisions',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            MdiIcons.account,
            size: 28, //Icon Size
          ),
          label: 'Profile',
        ),
      ],
    );



    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home()
    );
  }

}
