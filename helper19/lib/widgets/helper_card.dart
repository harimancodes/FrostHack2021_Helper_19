import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelperCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: 14,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            child: Card(
              margin: EdgeInsets.all(5),
              semanticContainer: true,
              color: Colors.blue,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  UserImage(),
                  SizedBox(height: 5),
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text("Phone"),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(' XX am - XX pm'),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget UserImage() {
  return Stack(
    children: [
      CircleAvatar(
        radius: 40.0,
        backgroundImage: AssetImage("assets/avatar/human.png"),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          child: Icon(
            Icons.call_rounded,
            color: Colors.green,
            size: 40,
          ),
        ),
      ),
    ],
  );
}
