import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'dashboard.dart';
import 'my_match.dart';
import 'profile.dart';
import 'statistik.dart';
import 'pertandingan.dart';
import 'profile_desc.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final _pageOption = [
    Dashboard(),    
    MyMatch(),
    Profile_Desc(),
    Statistik(),
    Pertandingan()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xffEFFFF0),
        animationCurve: Curves.fastOutSlowIn,
        height: 60.0,

        items: <Widget>[
          Icon(Icons.dashboard, size: 30,color: Colors.white),
          Icon(Icons.score, size: 30,color: Colors.white),
          Icon(Icons.person, size: 30,color: Colors.white),
          Icon(Icons.equalizer, size: 30,color: Colors.white),
          Icon(Icons.rowing, size: 30,color: Colors.white,),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          //Handle button tap
        },
        color: Colors.green,
      ),
    );
  }
}
