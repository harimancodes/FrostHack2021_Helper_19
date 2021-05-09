import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helper19/model/user.dart';
import 'package:helper19/widgets/login_screen.dart';

import 'home_screen.dart';

class ProfilePage extends StatefulWidget {
  User _user;
  ProfilePage(this._user);
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.reverse();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
                color: Colors.blue,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(FontAwesomeIcons.signOutAlt),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
                ;
              }),
        ],
      ),
      body: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset.zero,
        ).animate(_animationController),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    child: Image(
                      image: NetworkImage(
                          'https://wallpaperaccess.com/full/4107266.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        height: 45,
                        width: 45,
                        child: IconButton(
                            icon: Icon(FontAwesomeIcons.camera),
                            onPressed: () {}),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.userAlt,
                          color: Color(0xff04009a),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Jithin Prakash K',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 10, bottom: 0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.phoneAlt,
                          color: Color(0xff77acf1),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${widget._user.number}',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 10, bottom: 0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.solidEnvelope,
                          color: Color(0xff3edbf0),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'jithinprakashk2525@gmail.com',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
