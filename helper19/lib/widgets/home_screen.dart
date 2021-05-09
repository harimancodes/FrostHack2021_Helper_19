import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:helper19/model/user.dart';
import 'package:helper19/widgets/helper.dart';
import 'package:helper19/widgets/profile.dart';
import 'package:helper19/widgets/service_screen.dart';

class HomeScreen extends StatefulWidget {
  User _user;

  HomeScreen(this._user);
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedItemIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Helper(),
      new ServiceScreen(widget._user),
      ProfilePage(widget._user),
    ];

    return SafeArea(
        top: false,
        child: Scaffold(
          body: _widgetOptions[_selectedItemIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.person_search_rounded),
                label: 'Helper',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedItemIndex,
            onTap: _onItemTap,
          ),
        ));
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }
}
