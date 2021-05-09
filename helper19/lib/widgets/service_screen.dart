import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:helper19/model/user.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_form.dart';

class ServiceScreen extends StatefulWidget {
  User _user;

  ServiceScreen(this._user);

  @override
  State<StatefulWidget> createState() => ServiceScreenState();
}

String imageURL =
    'https://images-na.ssl-images-amazon.com/images/I/51id4gkERcS._AC_SL1013_.jpg';

class ServiceScreenState extends State<ServiceScreen>
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
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) =>
                IconButton(icon: Icon(Icons.location_pin), onPressed: () {}),
          ),
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          title: Center(
            child: Text(
              'Services',
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
                  showSearch(context: context, delegate: DataSearch());
                })
          ],
          backgroundColor: Colors.white,
          elevation: 5.0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              ServiceCard(
                imageURL: imageURL,
                itemName: 'Oximeter',
                availability: 'Yes',
                postedBy: 'ABC Person',
                date: '05/10/21',
                phoneNumber: '1234567890',
              ),
              SizedBox(
                height: 10,
              ),
              ServiceCard(
                imageURL: imageURL,
                itemName: 'Oximeter',
                availability: 'Yes',
                postedBy: 'ABC Person',
                date: '05/10/21',
                phoneNumber: '1234567890',
              ),
              SizedBox(
                height: 10,
              ),
              ServiceCard(
                imageURL: imageURL,
                itemName: 'Oximeter',
                availability: 'Yes',
                postedBy: 'ABC Person',
                date: '05/10/21',
                phoneNumber: '1234567890',
              ),
              SizedBox(
                height: 10,
              ),
              ServiceCard(
                imageURL: imageURL,
                itemName: 'Oximeter',
                availability: 'Yes',
                postedBy: 'ABC Person',
                date: '05/10/21',
                phoneNumber: '1234567890',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          backgroundColor: Color(0xFF333366),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomForm()),
            );
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  ServiceCard(
      {String this.imageURL,
      this.itemName,
      String this.availability,
      String this.postedBy,
      String this.date,
      String this.phoneNumber});
  String imageURL;
  String itemName;
  String availability;
  String postedBy;
  String date;
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          height: 124.0,
          margin: new EdgeInsets.only(left: 46.0, right: 10),
          decoration: new BoxDecoration(
            color: new Color(0xFF333366),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 60, top: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    itemName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Availability: $availability',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Posted by: $postedBy',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Added On: $date',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 22.5,
        left: 5,
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageURL),
          radius: 40,
        ),
      ),
      Positioned(
        bottom: 40,
        right: 30,
        child: IconButton(
            icon: Icon(
              FontAwesomeIcons.phoneAlt,
              color: Colors.white,
            ),
            onPressed: () {
              _callNumber(phoneNumber);
            }),
      )
    ]);
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}

_launchPhoneURL(String phoneNumber) async {
  String url = 'tel:' + phoneNumber;

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class DataSearch extends SearchDelegate<String> {
  final serviceNames = [
    'Oximeter',
    'Home rent',
    'flat rental',
    'helper',
    'Oxygen Cylinder'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show results
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show suggestions
    final suggestionList = query.isEmpty
        ? serviceNames
        : serviceNames.where((element) => element.contains(query)).toList();

    return Container(
      height: 240,
      child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            // showResults(context);
          },
          leading: Icon(Icons.construction),
          title: SubstringHighlight(
            text: suggestionList[index],
            term: query,
            textStyleHighlight: TextStyle(color: Colors.blue),
          ),
        ),
        itemCount: suggestionList.length,
      ),
    );
  }
}
