import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'my_match.dart';
import 'profile_desc.dart';
import 'login_form.dart';

void main() async => runApp(LoginForm());

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final _pageOption = [Dashboard(), MyMatch(), Profile_Desc()];

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
          Icon(Icons.dashboard, size: 35, color: Colors.white),
          Icon(Icons.score, size: 35, color: Colors.white),
          Icon(Icons.person, size: 35, color: Colors.white),
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
