import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}
final _formKey = GlobalKey<FormState>();
class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Service Form',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 16, left: 16),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    icon: Icon(Icons.adjust),
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mandatory Field';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    icon: Icon(Icons.adjust),
                    hintText: 'For eg. House Rent, Oximeter etc.',
                    labelText: 'Item Name',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mandatory Field';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    icon: Icon(Icons.adjust),
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mandatory Field';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    icon: Icon(Icons.adjust),
                    hintText: 'Email ID',
                    labelText: 'Email ID',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mandatory Field';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
