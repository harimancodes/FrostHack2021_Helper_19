import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helper19/widgets/helper_card.dart';

class Helper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelperState();
}

class HelperState extends State<Helper> with SingleTickerProviderStateMixin {
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
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          title: Center(
            child: Text(
              'Helpers',
              style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                onPressed: () {
                  // showSearch(context: context, delegate: DataSearch());
                })
          ],
          backgroundColor: Colors.white,
        ),
        body: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1, 0),
            end: Offset.zero,
          ).animate(_animationController),
          child: Stack(
            children: [HelperCardWidget()],
          ),
        ),
      ),
    );
  }
}
