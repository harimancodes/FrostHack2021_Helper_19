import 'package:flutter/material.dart';
import 'package:helper19/model/user.dart';
import 'package:helper19/widgets/home_screen.dart';
import 'package:helper19/widgets/profile.dart';
import 'package:helper19/widgets/service_screen.dart';

import 'helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User user;
  String _phoneNumber, _dropDownValue = 'India (+91)';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.elliptical(500, 80),
                      bottomRight: const Radius.elliptical(500, 80),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 420, right: 30, left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _dropDownValue,
                      items: ["India (+91)", '']
                          .map(
                            (val) => DropdownMenuItem(
                              child: Text(val),
                              value: val,
                            ),
                          )
                          .toList(),
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _dropDownValue = value;
                        });
                      },
                      decoration: InputDecoration(),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      onChanged: (val) {
                        _phoneNumber = val.toString();
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Your phone number",
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 40.0,
                      width: 280.0,
                      child: GestureDetector(
                        onTap: () {
                          user = new User(_phoneNumber);
                          print("User phone number : ${user.number}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(user)));
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: Colors.blueAccent,
                          color: Colors.blue,
                          elevation: 7.0,
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
